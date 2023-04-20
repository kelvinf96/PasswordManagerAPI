namespace PasswordManagerAPI.Services
{
    using PasswordManagerAPI.Data;
    using PasswordManagerAPI.Models;
    using System;
    using System.Security.Cryptography;
    using System.Text;



    public class PasswordService: IPasswordService
    {
        //context for database
        private readonly PasswordManagerContext _dbContext;

        //constructor for password service - init db context
        public PasswordService(PasswordManagerContext dbContext)
        {
            _dbContext = dbContext;
        }


        string IPasswordService.GetPassword(string phoneId, string passwordName)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);
 

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }

            var password = _dbContext.Password.SingleOrDefault(p => p.UserId == user.UserId && p.PasswordName == passwordName);

            if (password == null)
            {
                // Passwords collection is null
                return $"{passwordName} not found";
            }


            var decryptedPassword = DecryptPassword(password.PasswordValue);

            return decryptedPassword;

        }


        List<object> IPasswordService.GetAllMyPasswords(string phoneId)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an empty list
                return new List<object>();
            }


            var passwords = _dbContext.Password.Where(p => p.UserId == user.UserId)
                .Select(p => new { PasswordName = p.PasswordName, PasswordValue = DecryptPassword(p.PasswordValue) })
                .ToList();

            if (passwords.Count == 0)
            {
                // If the user has no passwords, return an empty list
                return new List<object>();
            }

            return passwords.Cast<object>().ToList();
        }




        string IPasswordService.AddPassword(string phoneId, string passwordName, string passwordValue)
        {
            // Get the user with the specified phone ID from the database
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }



            // Encrypt the password
            var encryptedPassword = ((IPasswordService)this).EncryptPassword(passwordValue);


            if (user.Passwords == null)
            {
                // Passwords collection is null
                user.Passwords = new List<Password>();
            }

            // Check if the password already exists for this user
            Password existingPassword = _dbContext.Password.SingleOrDefault(p => p.UserId == user.UserId && p.PasswordName == passwordName);


            if (existingPassword != null)
            {
                // If the password already exists, update its value and return a success message
                existingPassword.PasswordValue = encryptedPassword;
                _dbContext.SaveChanges();

                return $"{passwordName} updated successfully";
            }
            else
            {
                // If the password doesn't exist, create a new one and add it to the user's passwords collection
                var password = new Password
                {
                    PasswordName = passwordName,
                    PasswordValue = encryptedPassword
                };

                user.Passwords.Add(password);
                _dbContext.SaveChanges();

                return $"{passwordName} added successfully";
            }
        }


        string IPasswordService.DeletePassword(string phoneId, string passwordName)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }
            Password existingPassword = _dbContext.Password.SingleOrDefault(p => p.UserId == user.UserId && p.PasswordName == passwordName);
            if (existingPassword == null)
            {
                // If the user doesn't exist, return an error message
                return "Password not found";
            }

            user.Passwords.Remove(existingPassword);
            _dbContext.SaveChanges();

            return $"Removed {passwordName}";
        }

        string IPasswordService.DeleteAllPasswords(string phoneId)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }

            List<Password> existingPasswords = _dbContext.Password.Where(p => p.UserId == user.UserId).ToList();
            int totalPasswords = existingPasswords.Count;

            if (totalPasswords < 1)
            {
                // If there are no passwords for the user, return an error message
                return "No passwords found";
            }

            _dbContext.Password.RemoveRange(existingPasswords);
            _dbContext.SaveChanges();

            return $"Removed all passwords ({totalPasswords})";
        }



        string IPasswordService.PasswordCount(string phoneId)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }

            List<Password> existingPasswords = _dbContext.Password.Where(p => p.UserId == user.UserId).ToList();

        

            return existingPasswords.Count().ToString();

        }


        string IPasswordService.EditPasswordName(string phoneId, string passwordName, string newPasswordName)
        {
            var user = _dbContext.Users.SingleOrDefault(u => u.PhoneId == phoneId);

            if (user == null)
            {
                // If the user doesn't exist, return an error message
                return "User not found";
            }

            Password existingPassword = _dbContext.Password.SingleOrDefault(p => p.UserId == user.UserId && p.PasswordName == passwordName);
            if (existingPassword == null)
            {
                // If the user doesn't exist, return an error message
                return "Password not found";
            }

            existingPassword.PasswordName = newPasswordName;
            
            _dbContext.SaveChanges();

            return $"Updated password name from {passwordName} to {newPasswordName}.";
        }



        //service to encrypt / decrypt passwords

        private const string EncryptionKey = "ead2ca2passwordmanager23"; // must be 16, 24 or 32 characters long  [TODO:Move to env]

        string IPasswordService.EncryptPassword(string password)
        {
            byte[] clearBytes = Encoding.Unicode.GetBytes(password);

            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
                0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
            });

                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
        }

         private static string DecryptPassword(string encryptedPassword)
        {
            byte[] cipherBytes = Convert.FromBase64String(encryptedPassword);

            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
                0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
                });

                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    return Encoding.Unicode.GetString(ms.ToArray());
                }
            }
        }





    }

}
