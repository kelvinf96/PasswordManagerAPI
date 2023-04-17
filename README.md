# PasswordManagerAPI

## Live URL: https://passwordmanagerapiead.azurewebsites.net

**User Endpoints:**
- Find user -> GET https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Users/find?phoneID=RhysPhoneId
	- Search all user models for phoneId and return user model.

- Add user -> POST https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Users/add?phoneID=RhysPhoneId
	- Search users for that phoneId.
	- If no phoneId found create user and return string 'User added'
	- If user found return string 'User already exists'.


**Password Endpoints:**
- Get all user's passwords -> GET https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/find/all?phoneId=RhysPhoneID
	- Search all user's passwords and return a list of objects with password name and value.
	- If no passwords found returns empty list.

- Find user's password by name -> GET https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/find/name?phoneId=RhysPhoneId&passwordName=Netflix
	- Search user's passwords by name and if found return the encrypted password value string.
	- If not found return string 'Password not found'.

- Add password to user -> POST https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/add?phoneId=RhysPhoneID&passwordName=Disney&passwordValue=HelloWorld
	- Will search for user's passwords by name, if it already exists, updates password value, otherwise will add new password to user.
	- Returns string message such as 'Password updated successfully' or 'Password added successfully'.

- Remove Password -> DELETE https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/remove?phoneId=RhysPhoneID&passwordName=Disney
	- Will search for user's passwords by name, if it exists, removes password row from table. Returns string 'Successfully removed password'
	- If password not found returns string 'Password not found'.
	
- Remove All Passwords -> DELETE https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/remove/all?phoneId=RhysPhoneID
	- Will search for all user's passwords
	- If more than 0 passwords found removes them from the table and returns 'All passwords removed'
	- Else returns 'No passwords found'
	
- Get user password count -> GET https://passwordmanagerapiead.azurewebsites.net/PasswordManager/api/Password/count?phoneId=RhysPhoneID
	- Will search for all user's passwords, count them and return the value as a string.
