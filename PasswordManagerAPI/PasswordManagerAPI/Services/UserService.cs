using PasswordManagerAPI.Models;
using PasswordManagerAPI.Data;


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

        public object GetUser(string phoneId)
        {
            var user = _dbContext.Users.Where(u => u.PhoneId == phoneId).Select(u => new
            {
                u.UserId,
                u.PhoneId
            }).FirstOrDefault();
          
       
            return user;

        }

        public string UpdateUser(User user)
        {
            throw new NotImplementedException();
        }

        public string AddUser(string phoneId)
        {
            User user = new(phoneId);
            _dbContext.Users.Add(user);
            _dbContext.SaveChanges();
            return "User added";
        }
    }
}
