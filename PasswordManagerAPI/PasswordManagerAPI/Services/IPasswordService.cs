using PasswordManagerAPI.Models;

namespace PasswordManagerAPI.Services
{
    public interface IPasswordService
    {
        public string EncryptPassword(string password);
        public string DecryptPassword(string encryptedPassword);
        string GetPassword(string phoneId, string passwordName);
        List<object> GetAllMyPasswords(string phoneId);
        string AddPassword(string phoneId, string passwordName, string passwordValue);
        string DeletePassword(string phoneId, string passwordName);

    }
}
