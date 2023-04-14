using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;
using PasswordManagerAPI.Services;

namespace PasswordManagerAPI.Models
{
    [DataContract]
    public class Password
    {
        [DataMember]
        [JsonPropertyName("userid")]
        public Guid UserId { get; init; }

        [Key]
        [DataMember]
        [JsonPropertyName("passwordid")]
        public Guid PasswordId { get; init; }  // <PK>

        [DataMember]
        [JsonPropertyName("passwordname")]
        public string PasswordName { get; set; }

        [NotNull]
        private string? encryptedPasswordValue;

        [NotNull]
        [DataMember]
        [JsonPropertyName("passwordvalue")]
        public string? PasswordValue
        {
            //return the encrypted password [decrypt on front end]
            get
            {
                return encryptedPasswordValue;
            }
            set
            {
                //password is encryped on init/set
                if (value == null)
                {
                    throw new ArgumentNullException(nameof(value));
                }

                PasswordService passwordService = new PasswordService();
                encryptedPasswordValue = passwordService.EncryptPassword(value);
            }
        }

        // Constructor for password
        public Password(Guid userId, string name, string password)
        {
            this.UserId = userId;
            this.PasswordId = Guid.NewGuid();
            this.PasswordName = name;
            this.PasswordValue = password;
        }
        public Password()
        {
            //for entity framework
        }

    }
}
