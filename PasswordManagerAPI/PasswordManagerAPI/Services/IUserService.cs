using PasswordManagerAPI.Models;

namespace PasswordManagerAPI.Services
{
    public interface IUserService
    {
        object GetUser(string phoneId);
        string AddUser(string phoneId);
        string UpdateUser(User user);
        string DeleteUser(string phoneId);
    }
}