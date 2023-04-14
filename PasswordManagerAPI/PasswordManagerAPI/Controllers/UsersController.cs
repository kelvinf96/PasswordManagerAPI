using Microsoft.AspNetCore.Mvc;
using PasswordManagerAPI.Models;
using PasswordManagerAPI.Services;

namespace PasswordManagerAPI.Controllers
{
    public class UsersController : Controller
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }


        //find user by phone
        [HttpPost("getDBUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetUserByPhone([FromBody] string phone)
        {
            if (string.IsNullOrEmpty(phone))
            {
                return BadRequest("Phone parameter is missing or empty");
            }

            User user = _userService.GetUser(phone);

            if (user == null)
            {
                return NotFound("No user found with that phone");
            }


            return Ok(user);
           
        }

        // add user by phone
        [HttpPost("addDBUser")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult AddUserByPhone([FromBody] string phone)
        {
            User user = _userService.GetUser(phone);
            if (user == null)
            {
                return Ok(_userService.AddUser(phone));
            
            }

            return NotFound("User already exists");

        }

   




    }
}
