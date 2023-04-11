using System.Runtime.Serialization;
using System.Text.Json.Serialization;
namespace PasswordManagerAPI;

[DataContract]
public class User
{
    [DataMember]
    [JsonPropertyName("userid")]
    public Guid UserId { get; init; } //<PK>

    [DataMember]
    [JsonPropertyName("phoneid")]
    public string? PhoneId { get; init; }

    public User(string phoneIn)
    {
        this.PhoneId = phoneIn;
        // Generate new GUID for users ID
        this.UserId = Guid.NewGuid();

    }
}

