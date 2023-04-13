
using Microsoft.AspNetCore.Mvc;
using PasswordManagerAPI.Models;
using PasswordManagerAPI.Services;

namespace PasswordManagerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PasswordManagerAPIController : ControllerBase
    {
        
        // simply for testing purpose, this will be swapped out for a cloud db
        private List<User> users = new List<User>()
        {
                    new User ("0896154071"),
                    new User ("0812345678"),

        };

        // Create two fake user Ids for testing purpose only
        public static Guid user1Id = System.Guid.NewGuid();
        public static Guid user2Id = Guid.NewGuid();
        
        
        

        private List<Password> passwords = new List<Password>()
        {
            // The user1 and user2 id's be swapped with the user who is creating the passwords ID
            new Password(user1Id, "Netflix", "TestPassword1"),
            new Password(user1Id, "SkyGo", "ManUrSh1t"),
            new Password(user2Id, "Youtube", "T3stPass2"),
        };

        //just to test encryption on PasswordService
        [HttpPost("encrypt")]
        public IActionResult EncryptPassword([FromBody] string plainPassword)
        {
            try
            {
                PasswordService passwordService = new PasswordService();
                string encryptedPassword = passwordService.EncryptPassword(plainPassword);
                return Ok(encryptedPassword);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET 
        [HttpGet("getallusers")]
        public IEnumerable<User> GetAllUsers()
        {
            return users.OrderBy(u => u.PhoneId);        
        }

        // GET api/getUser/userphonenum 
        [HttpGet("getUser/{phone}", Name = "GetUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]         
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<User> GetUser(string phone)
        {
            // Find the requested user based off the phone number provided, else return not found
            User requestedUser = users.SingleOrDefault(u => u.PhoneId == phone);
            if (requestedUser == null)
            {
                return NotFound();
            }
            return Ok(requestedUser);
        }

        // POST api/addUser
        [HttpPost("addUser")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult AddNewUser([FromBody] String newUserPhone)
        {
            
            // ensure the phone number is not already in use, if not create user and add, else return error
            var record = users.SingleOrDefault(u => u.PhoneId == newUserPhone);
            if (record == null)
            {
                User newUser = new User(newUserPhone);
                users.Add(newUser);
                // This can be removed at later date, purely for purpose of ensuring user is added
                foreach( var u  in users)
                {
                    Console.WriteLine(u.PhoneId);
                }
                
                
                return CreatedAtRoute("GetUser", new { phone = newUser.PhoneId }, newUser);
            }
            else
            {
                return BadRequest("Phone number already in use");     
            }
        }

        //
        // Controllers for Passwords
        //

        // GET allPasswords
        [HttpGet("getAllPasswords")]
        public IEnumerable<Password> GetAllPasswords()
        {
            return passwords.OrderBy(p => p.PasswordName);
        }

        // GET api/getUserPasswords/userid 
        [HttpGet("getUserPasswords/{user}", Name = "GetUserPasswords")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Password> GetUserPasswords(Guid user)
        {
            // Find all passwords for that user
            List<Password> requestedPasswords = passwords.FindAll(p => p.UserId == user);
            if (requestedPasswords == null)
            {
                return NotFound();
            }
            return Ok(requestedPasswords);
        }

        // GET api/getUserSpecificPassword/userid/passwordname
        [HttpGet("getUserSpecificPassword/{user}/{passwordname}", Name = "GetUserSpecificPassword")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Password> GetUserSpecificPasswords(Guid user, String passwordname)
        {
            // Find the specific password for user, ex. get Kelvins Netflix password
            Password requestedPassword = passwords.SingleOrDefault(p => p.UserId == user && p.PasswordName == passwordname);
            if (requestedPassword == null)
            {
                return NotFound();
            }
            return Ok(requestedPassword);
        }

        // POST api/addPassword
        [HttpPost("addPassword")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult AddNewPassword([FromBody] Guid user, String passwordname, String passwordvalue)
        {

            // check if the user already has a password for this eg. Kelvin already has a password for Netflix
            var record = passwords.SingleOrDefault(p => p.UserId == user && p.PasswordName == passwordname);
            if (record == null)
            {
                Password newPassword = new Password(user, passwordname, passwordvalue);
                passwords.Add(newPassword);
                // This can be removed at later date, purely for purpose of ensuring user is added
                foreach (var p in passwords)
                {
                    Console.WriteLine($"{p.UserId}'s password for {p.PasswordName} is {p.PasswordValue}.");
                }

                
                return CreatedAtRoute("GetUserSpecificPassword", new { user = newPassword.UserId, passwordname = newPassword.PasswordName }, newPassword);
            }
            else
            {
                return BadRequest($"You already have a password for {passwordname}");      
            }
        }

    }
}
