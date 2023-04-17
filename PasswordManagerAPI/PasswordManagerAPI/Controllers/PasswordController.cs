using Microsoft.AspNetCore.Mvc;
using PasswordManagerAPI.Models;
using PasswordManagerAPI.Services;
using System.ComponentModel.DataAnnotations;

namespace PasswordManagerAPI.Controllers
{
    [Route("PasswordManager/api/[controller]")]
    [ApiController]
    public class PasswordController : Controller
    {

        private readonly IPasswordService _passwordService;

        public PasswordController(IUserService userService, IPasswordService passwordService)
        {
            _passwordService = passwordService;
        }

        // add password to user
        // if password name already exists, will update current password value
        [HttpPost("add")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult AddPasswordToUser([Required] string phoneId, [Required] string passwordName, [Required] string passwordValue)
        {

            return Ok(_passwordService.AddPassword(phoneId, passwordName, passwordValue));


        }
        // get password by name
        [HttpGet("find/name")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordByName([Required] string phoneId, [Required] string passwordName)
        {

            return Ok(_passwordService.GetPassword(phoneId, passwordName));


        }


        // get all paswords by user
        [HttpGet("find/all")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordsByUser([Required]string phoneId)
        {

            return Ok(_passwordService.GetAllMyPasswords(phoneId));


        }

        // remove password
        [HttpDelete("remove")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordsByUser([Required] string phoneId, [Required] string passwordName)
        {

            return Ok(_passwordService.DeletePassword(phoneId, passwordName));


        }
        [HttpDelete("remove/all")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult RemoveAllPasswordsByUser([Required] string phoneId)
        {

            return Ok(_passwordService.DeleteAllPasswords(phoneId));


        }


        // edit password name
        [HttpPut("edit/name")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordsByUser([Required] string phoneId, [Required] string passwordName, [Required] string newPasswordName)
        {

            return Ok(_passwordService.EditPasswordName(phoneId, passwordName, newPasswordName));

        }


        // get passowrd count
        [HttpGet("count")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult GetPasswordCount([Required] string phoneId)
        {

            return Ok(_passwordService.PasswordCount(phoneId));

        }

    }
}
