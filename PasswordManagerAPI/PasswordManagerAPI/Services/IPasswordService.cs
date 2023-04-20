using PasswordManagerAPI.Models;

namespace PasswordManagerAPI.Services
{
    public interface IPasswordService
    {
        string EncryptPassword(string password);
        string GetPassword(string phoneId, string passwordName);
        List<object> GetAllMyPasswords(string phoneId);
        string AddPassword(string phoneId, string passwordName, string passwordValue);
        string DeletePassword(string phoneId, string passwordName);

        string DeleteAllPasswords(string phoneId);
        string EditPasswordName(string phoneId, string passwordName, string newPasswordName);

        string PasswordCount(string phoneId);


    }
}
