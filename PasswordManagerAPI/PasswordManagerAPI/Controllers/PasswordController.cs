using Microsoft.AspNetCore.Mvc;
using PasswordManagerAPI.Models;
using PasswordManagerAPI.Services;
using System.ComponentModel.DataAnnotations;

namespace PasswordManagerAPI.Controllers
{
    public class PasswordController : Controller
    {
        private readonly IUserService _userService;
        private readonly IPasswordService _passwordService;

        public PasswordController(IUserService userService, IPasswordService passwordService)
        {
            _userService = userService;
            _passwordService = passwordService;
        }

        // add password to user
        [HttpPost("addDBPassword")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult AddPasswordToUser([Required] string phoneId, [Required] string passwordName, [Required] string passwordValue)
        {

            return Ok(_passwordService.AddPassword(phoneId, passwordName, passwordValue));


        }
        // get password by name
        [HttpGet("getDBPassword")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordByName([Required] string phoneId, [Required] string passwordName)
        {

            return Ok(_passwordService.GetPassword(phoneId, passwordName));


        }


        // get all paswords by user
        [HttpGet("getAllDBPasswords")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordsByUser([Required]string phoneId)
        {

            return Ok(_passwordService.GetAllMyPasswords(phoneId));


        }

    }
}
