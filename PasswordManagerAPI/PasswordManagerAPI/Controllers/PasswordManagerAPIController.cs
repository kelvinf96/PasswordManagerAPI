
using Microsoft.AspNetCore.Mvc;

namespace PasswordManagerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PasswordManagerAPIController : ControllerBase
    {

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
    }
}
