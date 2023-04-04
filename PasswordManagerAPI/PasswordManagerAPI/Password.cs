using System;
namespace PasswordManagerAPI
{
	public class Password
	{
		// Links tables by using the user object who owns the password as userId <FK>
		public User userId { get; init; }
		public Guid passwordid { get; init; }  // <PK>
		public string passwordName { get; set; }

		// Will need to convert this string to SHA256
		public string passwordvalue { get; set; }

		// Will need properties here for password name and value, with some validations


	}
}

