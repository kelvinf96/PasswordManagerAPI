using PasswordManagerAPI.Models;
using PasswordManagerAPI.Data;
using PasswordManagerAPI.Services;

namespace PasswordManagerAPI.Services
{
    public class UserService : IUserService
    {
        private readonly PasswordManagerContext _dbContext;

        public UserService(PasswordManagerContext dbContext)
        {
            _dbContext = dbContext;
        }

        

        public string DeleteUser(string phoneId)
        {
            throw new NotImplementedException();
        }

        public User GetUser(string phoneId)
        {
            User ?user = _dbContext.Users.FirstOrDefault(x => x.PhoneId == phoneId);
       
            return user;

        }

        public string UpdateUser(User user)
        {
            throw new NotImplementedException();
        }

        public string AddUser(string phoneId)
        {
            User user = new User(phoneId=phoneId);
            _dbContext.Users.Add(user);
            _dbContext.SaveChanges();
            return "User added";
        }
    }
}
