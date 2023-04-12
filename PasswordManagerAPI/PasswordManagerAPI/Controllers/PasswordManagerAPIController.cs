
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
                foreach( var u  in users)
                {
                    Console.WriteLine(u.PhoneId);
                }                                    
                // create http response with Created status code and listing serialised as content and Location header set to URI for new resource
                return CreatedAtRoute("GetUser", new { phone = newUser.PhoneId }, newUser);
            }
            else
            {
                return BadRequest("Phone number already in use");      // 400, already exists
            }
        }
    }
}
