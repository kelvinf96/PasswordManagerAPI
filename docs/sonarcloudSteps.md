Steps to run Sonarcloud Analysis:
1. dotnet tool install --global dotnet-sonarscanner
2. dotnet sonarscanner begin /key:rhyskelvineadca2passwordmanager /o:"eadca2" /n:sonar.projectName="PasswordManager" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="b4b53e721a398b86ab946815f440e9e7e41297ab" /d:sonar.projectBaseDir="<path to project root (where csprojfile is)>"
3. dotnet build
4. dotnet sonarscanner end /d:sonar.login="b4b53e721a398b86ab946815f440e9e7e41297ab"