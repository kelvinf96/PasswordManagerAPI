using PasswordManagerAPI.Services;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

using System.ComponentModel.DataAnnotations;

namespace PasswordManagerAPI.Models;

[DataContract]
public class User
{
    [Key]//<PK>
    [DataMember]
    [JsonPropertyName("userid")]
    public Guid UserId { get; init; } 

    [Required]
    [DataMember]
    [JsonPropertyName("phoneid")]
    public string? PhoneId { get; init; }

    public User(string phoneIn)
    {
        PhoneId = phoneIn;
        // Generate new GUID for users ID
        UserId = Guid.NewGuid();

        // Initialize the Passwords collection to an empty collection
        Passwords = new List<Password>();

    }

    public User()
    {
        // Required by Entity Framework Core
    }

    //create a 1 to many relationship with entity framework by having a collection of password objects
    public ICollection<Password>? Passwords { get;set; }
}

