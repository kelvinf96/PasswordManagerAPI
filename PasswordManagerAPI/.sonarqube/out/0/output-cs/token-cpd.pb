�>
{C:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Controllers\PasswordController.cs
	namespace 	
PasswordManagerAPI
 
. 
Controllers (
{ 
[ 
Route 

(
 
$str -
)- .
]. /
[		 
ApiController		 
]		 
public

 

class

 
PasswordController

 #
:

$ %

Controller

& 0
{ 
private 
readonly 
IPasswordService )
_passwordService* :
;: ;
public 
PasswordController !
(! "
IUserService" .
userService/ :
,: ;
IPasswordService< L
passwordServiceM \
)\ ]
{ 	
_passwordService 
= 
passwordService .
;. /
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status201Created* :
): ;
]; <
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status400BadRequest* =
)= >
]> ?
public 
IActionResult 
AddPasswordToUser .
(. /
[/ 0
Required0 8
]8 9
string: @
phoneIdA H
,H I
[J K
RequiredK S
]S T
stringU [
passwordName\ h
,h i
[j k
Requiredk s
]s t
stringu {
passwordValue	| �
)
� �
{ 	
return 
Ok 
( 
_passwordService &
.& '
AddPassword' 2
(2 3
phoneId3 :
,: ;
passwordName< H
,H I
passwordValueJ W
)W X
)X Y
;Y Z
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
["" 	 
ProducesResponseType""	 
("" 
StatusCodes"" )
."") *
Status200OK""* 5
)""5 6
]""6 7
[## 	 
ProducesResponseType##	 
(## 
StatusCodes## )
.##) *
Status400BadRequest##* =
)##= >
]##> ?
public$$ 
IActionResult$$ 
GetPasswordByName$$ .
($$. /
[$$/ 0
Required$$0 8
]$$8 9
string$$: @
phoneId$$A H
,$$H I
[$$J K
Required$$K S
]$$S T
string$$U [
passwordName$$\ h
)$$h i
{%% 	
return'' 
Ok'' 
('' 
_passwordService'' &
.''& '
GetPassword''' 2
(''2 3
phoneId''3 :
,'': ;
passwordName''< H
)''H I
)''I J
;''J K
}** 	
[.. 	
HttpGet..	 
(.. 
$str.. 
).. 
].. 
[// 	 
ProducesResponseType//	 
(// 
StatusCodes// )
.//) *
Status200OK//* 5
)//5 6
]//6 7
[00 	 
ProducesResponseType00	 
(00 
StatusCodes00 )
.00) *
Status400BadRequest00* =
)00= >
]00> ?
public11 
IActionResult11 
GetPasswordsByUser11 /
(11/ 0
[110 1
Required111 9
]119 :
string11: @
phoneId11A H
)11H I
{22 	
return44 
Ok44 
(44 
_passwordService44 &
.44& '
GetAllMyPasswords44' 8
(448 9
phoneId449 @
)44@ A
)44A B
;44B C
}77 	
[:: 	

HttpDelete::	 
(:: 
$str:: 
):: 
]:: 
[;; 	 
ProducesResponseType;;	 
(;; 
StatusCodes;; )
.;;) *
Status200OK;;* 5
);;5 6
];;6 7
[<< 	 
ProducesResponseType<<	 
(<< 
StatusCodes<< )
.<<) *
Status400BadRequest<<* =
)<<= >
]<<> ?
public== 
IActionResult== 
GetPasswordsByUser== /
(==/ 0
[==0 1
Required==1 9
]==9 :
string==; A
phoneId==B I
,==I J
[==K L
Required==L T
]==T U
string==V \
passwordName==] i
)==i j
{>> 	
return@@ 
Ok@@ 
(@@ 
_passwordService@@ &
.@@& '
DeletePassword@@' 5
(@@5 6
phoneId@@6 =
,@@= >
passwordName@@? K
)@@K L
)@@L M
;@@M N
}CC 	
[DD 	

HttpDeleteDD	 
(DD 
$strDD  
)DD  !
]DD! "
[EE 	 
ProducesResponseTypeEE	 
(EE 
StatusCodesEE )
.EE) *
Status200OKEE* 5
)EE5 6
]EE6 7
[FF 	 
ProducesResponseTypeFF	 
(FF 
StatusCodesFF )
.FF) *
Status400BadRequestFF* =
)FF= >
]FF> ?
publicGG 
IActionResultGG $
RemoveAllPasswordsByUserGG 5
(GG5 6
[GG6 7
RequiredGG7 ?
]GG? @
stringGGA G
phoneIdGGH O
)GGO P
{HH 	
returnJJ 
OkJJ 
(JJ 
_passwordServiceJJ &
.JJ& '
DeleteAllPasswordsJJ' 9
(JJ9 :
phoneIdJJ: A
)JJA B
)JJB C
;JJC D
}MM 	
[QQ 	
HttpPutQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
[RR 	 
ProducesResponseTypeRR	 
(RR 
StatusCodesRR )
.RR) *
Status200OKRR* 5
)RR5 6
]RR6 7
[SS 	 
ProducesResponseTypeSS	 
(SS 
StatusCodesSS )
.SS) *
Status400BadRequestSS* =
)SS= >
]SS> ?
publicTT 
IActionResultTT 
GetPasswordsByUserTT /
(TT/ 0
[TT0 1
RequiredTT1 9
]TT9 :
stringTT; A
phoneIdTTB I
,TTI J
[TTK L
RequiredTTL T
]TTT U
stringTTV \
passwordNameTT] i
,TTi j
[TTk l
RequiredTTl t
]TTt u
stringTTv |
newPasswordName	TT} �
)
TT� �
{UU 	
returnWW 
OkWW 
(WW 
_passwordServiceWW &
.WW& '
EditPasswordNameWW' 7
(WW7 8
phoneIdWW8 ?
,WW? @
passwordNameWWA M
,WWM N
newPasswordNameWWO ^
)WW^ _
)WW_ `
;WW` a
}YY 	
[]] 	
HttpGet]]	 
(]] 
$str]] 
)]] 
]]] 
[^^ 	 
ProducesResponseType^^	 
(^^ 
StatusCodes^^ )
.^^) *
Status200OK^^* 5
)^^5 6
]^^6 7
[__ 	 
ProducesResponseType__	 
(__ 
StatusCodes__ )
.__) *
Status400BadRequest__* =
)__= >
]__> ?
public`` 
IActionResult`` 
GetPasswordCount`` -
(``- .
[``. /
Required``/ 7
]``7 8
string``9 ?
phoneId``@ G
)``G H
{aa 	
returncc 
Okcc 
(cc 
_passwordServicecc &
.cc& '
PasswordCountcc' 4
(cc4 5
phoneIdcc5 <
)cc< =
)cc= >
;cc> ?
}ee 	
}gg 
}hh �
�C:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Controllers\PasswordManagerAPIController.cs
	namespace 	
PasswordManagerAPI
 
. 
Controllers (
{ 
}�� �
xC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Controllers\UsersController.cs
	namespace 	
PasswordManagerAPI
 
. 
Controllers (
{ 
[ 
Route 

(
 
$str -
)- .
]. /
[		 
ApiController		 
]		 
public

 

class

 
UsersController

  
:

! "

Controller

# -
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
UsersController 
( 
IUserService +
userService, 7
)7 8
{ 	
_userService 
= 
userService &
;& '
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status400BadRequest* =
)= >
]> ?
public 
IActionResult 
GetUserByPhone +
(+ ,
[, -
Required- 5
]5 6
string7 =
phoneID> E
)E F
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
phoneID% ,
), -
)- .
{ 
return 

BadRequest !
(! "
$str" G
)G H
;H I
} 
object 
user 
= 
_userService &
.& '
GetUser' .
(. /
phoneID/ 6
)6 7
;7 8
if!! 
(!! 
user!! 
==!! 
null!! 
)!! 
{"" 
return## 
NotFound## 
(##  
$str##  ?
)##? @
;##@ A
}$$ 
return'' 
Ok'' 
('' 
user'' 
)'' 
;'' 
})) 	
[,, 	
HttpPost,,	 
(,, 
$str,, 
),, 
],, 
[-- 	 
ProducesResponseType--	 
(-- 
StatusCodes-- )
.--) *
Status201Created--* :
)--: ;
]--; <
[.. 	 
ProducesResponseType..	 
(.. 
StatusCodes.. )
...) *
Status400BadRequest..* =
)..= >
]..> ?
public// 
IActionResult// 
AddUserByPhone// +
(//+ ,
[//, -
Required//- 5
]//5 6
string//7 =
phoneID//> E
)//E F
{00 	
object11 
user11 
=11 
_userService11 &
.11& '
GetUser11' .
(11. /
phoneID11/ 6
)116 7
;117 8
if22 
(22 
user22 
==22 
null22 
)22 
{33 
return44 
Ok44 
(44 
_userService44 &
.44& '
AddUser44' .
(44. /
phoneID44/ 6
)446 7
)447 8
;448 9
}66 
return88 
NotFound88 
(88 
$str88 1
)881 2
;882 3
}:: 	
}AA 
}BB �
xC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Data\PasswordManagerContext.cs
	namespace 	
PasswordManagerAPI
 
. 
Data !
{ 
public 

class "
PasswordManagerContext '
:( )
	DbContext* 3
{ 
public		 "
PasswordManagerContext		 )
(		) *
DbContextOptions		* :
<		: ;"
PasswordManagerContext		; Q
>		Q R
options		S Z
)		Z [
:

 
base

 
(

 
options

 
)

 
{ 
} 
public 
DbSet 
< 
User 
> 
Users $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DbSet 
< 
Password 
> 
Password '
{( )
get* -
;- .
set. 1
;1 2
}3 4
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
if 
( 
! 
optionsBuilder 
.  
IsConfigured  ,
), -
{ 
IConfigurationRoot "
configuration# 0
=1 2
new3 6 
ConfigurationBuilder7 K
(K L
)L M
. 
SetBasePath  
(  !
	AppDomain! *
.* +
CurrentDomain+ 8
.8 9
BaseDirectory9 F
)F G
. 
AddJsonFile  
(  !
$str! 3
)3 4
. 
Build 
( 
) 
; 
optionsBuilder 
. 
UseSqlServer +
(+ ,
configuration, 9
.9 :
GetConnectionString: M
(M N
$strN a
)a b
)b c
;c d
} 
} 	
} 
}   �'
�C:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Migrations\20230412160149_InitialCreate.cs
	namespace 	
PasswordManagerAPI
 
. 

Migrations '
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
UserId 
= 
table "
." #
Column# )
<) *
Guid* .
>. /
(/ 0
type0 4
:4 5
$str6 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
PhoneId 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
UserId8 >
)> ?
;? @
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 

PasswordId 
=  
table! &
.& '
Column' -
<- .
Guid. 2
>2 3
(3 4
type4 8
:8 9
$str: L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _
UserId 
= 
table "
." #
Column# )
<) *
Guid* .
>. /
(/ 0
type0 4
:4 5
$str6 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
PasswordName    
=  ! "
table  # (
.  ( )
Column  ) /
<  / 0
string  0 6
>  6 7
(  7 8
type  8 <
:  < =
$str  > M
,  M N
nullable  O W
:  W X
true  Y ]
)  ] ^
,  ^ _
PasswordValue!! !
=!!" #
table!!$ )
.!!) *
Column!!* 0
<!!0 1
string!!1 7
>!!7 8
(!!8 9
type!!9 =
:!!= >
$str!!? N
,!!N O
nullable!!P X
:!!X Y
false!!Z _
)!!_ `
}"" 
,"" 
constraints## 
:## 
table## "
=>### %
{$$ 
table%% 
.%% 

PrimaryKey%% $
(%%$ %
$str%%% 2
,%%2 3
x%%4 5
=>%%6 8
x%%9 :
.%%: ;

PasswordId%%; E
)%%E F
;%%F G
table&& 
.&& 

ForeignKey&& $
(&&$ %
name'' 
:'' 
$str'' 8
,''8 9
column(( 
:(( 
x((  !
=>((" $
x((% &
.((& '
UserId((' -
,((- .
principalTable)) &
:))& '
$str))( /
,))/ 0
principalColumn** '
:**' (
$str**) 1
,**1 2
onDelete++  
:++  !
ReferentialAction++" 3
.++3 4
Cascade++4 ;
)++; <
;++< =
},, 
),, 
;,, 
migrationBuilder.. 
... 
CreateIndex.. (
(..( )
name// 
:// 
$str// *
,//* +
table00 
:00 
$str00 !
,00! "
column11 
:11 
$str11  
)11  !
;11! "
}22 	
	protected55 
override55 
void55 
Down55  $
(55$ %
MigrationBuilder55% 5
migrationBuilder556 F
)55F G
{66 	
migrationBuilder77 
.77 
	DropTable77 &
(77& '
name88 
:88 
$str88  
)88  !
;88! "
migrationBuilder:: 
.:: 
	DropTable:: &
(::& '
name;; 
:;; 
$str;; 
);; 
;;; 
}<< 	
}== 
}>> �
�C:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Migrations\20230414223328_PasswordCollectionInit.cs
	namespace 	
PasswordManagerAPI
 
. 

Migrations '
{ 
public 

partial 
class "
PasswordCollectionInit /
:0 1
	Migration2 ;
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} �
lC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Models\Password.cs
	namespace 	
PasswordManagerAPI
 
. 
Models #
{ 
[		 
DataContract		 
]		 
public

 

class

 
Password

 
{ 
[ 	

DataMember	 
] 
[ 	
JsonPropertyName	 
( 
$str "
)" #
]# $
public 
Guid 
UserId 
{ 
get  
;  !
init" &
;& '
}( )
[ 	
Key	 
] 
[ 	

DataMember	 
] 
[ 	
JsonPropertyName	 
( 
$str &
)& '
]' (
public 
Guid 

PasswordId 
{  
get! $
;$ %
init& *
;* +
}, -
[ 	

DataMember	 
] 
[ 	
JsonPropertyName	 
( 
$str (
)( )
]) *
public 
string 
? 
PasswordName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
NotNull	 
] 
private 
string 
? "
encryptedPasswordValue .
;. /
[ 	
NotNull	 
] 
[ 	

DataMember	 
] 
[   	
JsonPropertyName  	 
(   
$str   )
)  ) *
]  * +
public!! 
string!! 
?!! 
PasswordValue!! $
{"" 	
get$$ 
{%% 
return&& "
encryptedPasswordValue&& -
;&&- .
}'' 
set(( 
{)) 
if** 
(** 
value** 
==** 
null** !
)**! "
{++ 
throw,, 
new,, !
ArgumentNullException,, 3
(,,3 4
nameof,,4 :
(,,: ;
value,,; @
),,@ A
),,A B
;,,B C
}-- "
encryptedPasswordValue// &
=//' (
value//) .
;//. /
}00 
}11 	
public44 
Password44 
(44 
Guid44 
userId44 #
,44# $
string44% +
name44, 0
,440 1
string442 8
password449 A
)44A B
{55 	
this66 
.66 
UserId66 
=66 
userId66  
;66  !
this77 
.77 

PasswordId77 
=77 
Guid77 "
.77" #
NewGuid77# *
(77* +
)77+ ,
;77, -
this88 
.88 
PasswordName88 
=88 
name88  $
;88$ %
this99 
.99 
PasswordValue99 
=99  
password99! )
;99) *
}:: 	
public;; 
Password;; 
(;; 
);; 
{<< 	
}>> 	
}@@ 
}AA �
hC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Models\User.cs
	namespace 	
PasswordManagerAPI
 
. 
Models #
;# $
[		 
DataContract		 
]		 
public

 
class

 
User

 
{ 
[ 
Key 
] 	
[ 

DataMember 
] 
[ 
JsonPropertyName 
( 
$str 
) 
]  
public 

Guid 
UserId 
{ 
get 
; 
init "
;" #
}$ %
[ 
Required 
] 
[ 

DataMember 
] 
[ 
JsonPropertyName 
( 
$str 
)  
]  !
public 

string 
? 
PhoneId 
{ 
get  
;  !
init" &
;& '
}( )
public 

User 
( 
string 
phoneIn 
) 
{ 
PhoneId 
= 
phoneIn 
; 
UserId 
= 
Guid 
. 
NewGuid 
( 
) 
;  
	Passwords 
= 
new 
List 
< 
Password %
>% &
(& '
)' (
;( )
} 
public!! 

User!! 
(!! 
)!! 
{"" 
}$$ 
public'' 

ICollection'' 
<'' 
Password'' 
>''  
?''  !
	Passwords''" +
{'', -
get''. 1
;''1 2
set''2 5
;''5 6
}''7 8
}(( �
dC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Program.cs
	namespace 	
PasswordManagerAPI
 
; 
public		 
class		 
Program		 
{

 
public 

static 
void 
Main 
( 
string "
[" #
]# $
args% )
)) *
{ 
var 
builder 
= 
WebApplication $
.$ %
CreateBuilder% 2
(2 3
args3 7
)7 8
;8 9
builder 
. 
Services 
. 
AddDbContext %
<% &"
PasswordManagerContext& <
>< =
(= >
options> E
=>F H
options 
. 
UseSqlServer 
( 
builder $
.$ %
Configuration% 2
.2 3
GetConnectionString3 F
(F G
$strG Z
)Z [
)[ \
)\ ]
;] ^
builder 
. 
Services 
. 
	AddScoped "
<" #
IUserService# /
,/ 0
UserService1 <
>< =
(= >
)> ?
;? @
builder 
. 
Services 
. 
	AddScoped "
<" #
IPasswordService# 3
,3 4
PasswordService5 D
>D E
(E F
)F G
;G H
builder 
. 
Services 
. 
AddControllers '
(' (
)( )
;) *
builder 
. 
Services 
. #
AddEndpointsApiExplorer 0
(0 1
)1 2
;2 3
builder 
. 
Services 
. 
AddSwaggerGen &
(& '
)' (
;( )
var 
app 
= 
builder 
. 
Build 
(  
)  !
;! "
if 

( 
app 
. 
Environment 
. 
IsDevelopment )
() *
)* +
)+ ,
{ 	
app 
. 

UseSwagger 
( 
) 
; 
app   
.   
UseSwaggerUI   
(   
)   
;   
}!! 	
app## 
.## 
UseHttpsRedirection## 
(##  
)##  !
;##! "
app%% 
.%% 
UseAuthorization%% 
(%% 
)%% 
;%% 
app(( 
.(( 
MapControllers(( 
((( 
)(( 
;(( 
app** 
.** 
Run** 
(** 
)** 
;** 
}++ 
},, �
vC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Services\IPasswordService.cs
	namespace 	
PasswordManagerAPI
 
. 
Services %
{ 
public 

	interface 
IPasswordService %
{ 
string 
EncryptPassword 
( 
string %
password& .
). /
;/ 0
string 
GetPassword 
( 
string !
phoneId" )
,) *
string+ 1
passwordName2 >
)> ?
;? @
List		 
<		 
object		 
>		 
GetAllMyPasswords		 &
(		& '
string		' -
phoneId		. 5
)		5 6
;		6 7
string

 
AddPassword

 
(

 
string

 !
phoneId

" )
,

) *
string

+ 1
passwordName

2 >
,

> ?
string

@ F
passwordValue

G T
)

T U
;

U V
string 
DeletePassword 
( 
string $
phoneId% ,
,, -
string. 4
passwordName5 A
)A B
;B C
string 
DeleteAllPasswords !
(! "
string" (
phoneId) 0
)0 1
;1 2
string 
EditPasswordName 
(  
string  &
phoneId' .
,. /
string0 6
passwordName7 C
,C D
stringE K
newPasswordNameL [
)[ \
;\ ]
string 
PasswordCount 
( 
string #
phoneId$ +
)+ ,
;, -
} 
} �
rC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Services\IUserService.cs
	namespace 	
PasswordManagerAPI
 
. 
Services %
{ 
public 

	interface 
IUserService !
{ 
object 
GetUser 
( 
string 
phoneId %
)% &
;& '
string 
AddUser 
( 
string 
phoneId %
)% &
;& '
string		 

UpdateUser		 
(		 
User		 
user		 #
)		# $
;		$ %
string

 

DeleteUser

 
(

 
string

  
phoneId

! (
)

( )
;

) *
} 
} ʯ
uC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Services\PasswordService.cs
	namespace 	
PasswordManagerAPI
 
. 
Services %
{ 
public 

class 
PasswordService  
:  !
IPasswordService" 2
{ 
private 
readonly "
PasswordManagerContext /

_dbContext0 :
;: ;
public 
PasswordService 
( "
PasswordManagerContext 5
	dbContext6 ?
)? @
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
string 
IPasswordService 
.  
GetPassword  +
(+ ,
string, 2
phoneId3 :
,: ;
string< B
passwordNameC O
)O P
{ 	
var 
user 
= 

_dbContext !
.! "
Users" '
.' (
SingleOrDefault( 7
(7 8
u8 9
=>: <
u= >
.> ?
PhoneId? F
==G I
phoneIdJ Q
)Q R
;R S
if 
( 
user 
== 
null 
) 
{ 
return 
$str '
;' (
}   
var"" 
password"" 
="" 

_dbContext"" %
.""% &
Password""& .
."". /
SingleOrDefault""/ >
(""> ?
p""? @
=>""A C
p""D E
.""E F
UserId""F L
==""M O
user""P T
.""T U
UserId""U [
&&""\ ^
p""_ `
.""` a
PasswordName""a m
==""n p
passwordName""q }
)""} ~
;""~ 
if$$ 
($$ 
password$$ 
==$$ 
null$$  
)$$  !
{%% 
return'' 
$"'' 
{'' 
passwordName'' &
}''& '
$str''' 1
"''1 2
;''2 3
}(( 
var++ 
decryptedPassword++ !
=++" #
DecryptPassword++$ 3
(++3 4
password++4 <
.++< =
PasswordValue++= J
)++J K
;++K L
return-- 
decryptedPassword-- $
;--$ %
}// 	
List22 
<22 
object22 
>22 
IPasswordService22 %
.22% &
GetAllMyPasswords22& 7
(227 8
string228 >
phoneId22? F
)22F G
{33 	
var44 
user44 
=44 

_dbContext44 !
.44! "
Users44" '
.44' (
SingleOrDefault44( 7
(447 8
u448 9
=>44: <
u44= >
.44> ?
PhoneId44? F
==44G I
phoneId44J Q
)44Q R
;44R S
if66 
(66 
user66 
==66 
null66 
)66 
{77 
return99 
new99 
List99 
<99  
object99  &
>99& '
(99' (
)99( )
;99) *
}:: 
var== 
	passwords== 
=== 

_dbContext== &
.==& '
Password==' /
.==/ 0
Where==0 5
(==5 6
p==6 7
=>==8 :
p==; <
.==< =
UserId=== C
====D F
user==G K
.==K L
UserId==L R
)==R S
.>> 
Select>> 
(>> 
p>> 
=>>> 
new>>  
{>>! "
PasswordName>># /
=>>0 1
p>>2 3
.>>3 4
PasswordName>>4 @
,>>@ A
PasswordValue>>B O
=>>P Q
DecryptPassword>>R a
(>>a b
p>>b c
.>>c d
PasswordValue>>d q
)>>q r
}>>s t
)>>t u
.?? 
ToList?? 
(?? 
)?? 
;?? 
ifAA 
(AA 
	passwordsAA 
.AA 
CountAA 
==AA  "
$numAA# $
)AA$ %
{BB 
returnDD 
newDD 
ListDD 
<DD  
objectDD  &
>DD& '
(DD' (
)DD( )
;DD) *
}EE 
returnGG 
	passwordsGG 
.GG 
CastGG !
<GG! "
objectGG" (
>GG( )
(GG) *
)GG* +
.GG+ ,
ToListGG, 2
(GG2 3
)GG3 4
;GG4 5
}HH 	
stringMM 
IPasswordServiceMM 
.MM  
AddPasswordMM  +
(MM+ ,
stringMM, 2
phoneIdMM3 :
,MM: ;
stringMM< B
passwordNameMMC O
,MMO P
stringMMQ W
passwordValueMMX e
)MMe f
{NN 	
varPP 
userPP 
=PP 

_dbContextPP !
.PP! "
UsersPP" '
.PP' (
SingleOrDefaultPP( 7
(PP7 8
uPP8 9
=>PP: <
uPP= >
.PP> ?
PhoneIdPP? F
==PPG I
phoneIdPPJ Q
)PPQ R
;PPR S
ifRR 
(RR 
userRR 
==RR 
nullRR 
)RR 
{SS 
returnUU 
$strUU '
;UU' (
}VV 
var[[ 
encryptedPassword[[ !
=[[" #
([[$ %
([[% &
IPasswordService[[& 6
)[[6 7
this[[7 ;
)[[; <
.[[< =
EncryptPassword[[= L
([[L M
passwordValue[[M Z
)[[Z [
;[[[ \
if^^ 
(^^ 
user^^ 
.^^ 
	Passwords^^ 
==^^ !
null^^" &
)^^& '
{__ 
useraa 
.aa 
	Passwordsaa 
=aa  
newaa! $
Listaa% )
<aa) *
Passwordaa* 2
>aa2 3
(aa3 4
)aa4 5
;aa5 6
}bb 
Passwordee 
existingPasswordee %
=ee& '

_dbContextee( 2
.ee2 3
Passwordee3 ;
.ee; <
SingleOrDefaultee< K
(eeK L
peeL M
=>eeN P
peeQ R
.eeR S
UserIdeeS Y
==eeZ \
useree] a
.eea b
UserIdeeb h
&&eei k
peel m
.eem n
PasswordNameeen z
==ee{ }
passwordName	ee~ �
)
ee� �
;
ee� �
ifhh 
(hh 
existingPasswordhh  
!=hh! #
nullhh$ (
)hh( )
{ii 
existingPasswordkk  
.kk  !
PasswordValuekk! .
=kk/ 0
encryptedPasswordkk1 B
;kkB C

_dbContextll 
.ll 
SaveChangesll &
(ll& '
)ll' (
;ll( )
returnnn 
$"nn 
{nn 
passwordNamenn &
}nn& '
$strnn' <
"nn< =
;nn= >
}oo 
elsepp 
{qq 
varss 
passwordss 
=ss 
newss "
Passwordss# +
{tt 
PasswordNameuu  
=uu! "
passwordNameuu# /
,uu/ 0
PasswordValuevv !
=vv" #
encryptedPasswordvv$ 5
}ww 
;ww 
useryy 
.yy 
	Passwordsyy 
.yy 
Addyy "
(yy" #
passwordyy# +
)yy+ ,
;yy, -

_dbContextzz 
.zz 
SaveChangeszz &
(zz& '
)zz' (
;zz( )
return|| 
$"|| 
{|| 
passwordName|| &
}||& '
$str||' :
"||: ;
;||; <
}}} 
}~~ 	
string
�� 
IPasswordService
�� 
.
��  
DeletePassword
��  .
(
��. /
string
��/ 5
phoneId
��6 =
,
��= >
string
��? E
passwordName
��F R
)
��R S
{
�� 	
var
�� 
user
�� 
=
�� 

_dbContext
�� !
.
��! "
Users
��" '
.
��' (
SingleOrDefault
��( 7
(
��7 8
u
��8 9
=>
��: <
u
��= >
.
��> ?
PhoneId
��? F
==
��G I
phoneId
��J Q
)
��Q R
;
��R S
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
$str
�� '
;
��' (
}
�� 
Password
�� 
existingPassword
�� %
=
��& '

_dbContext
��( 2
.
��2 3
Password
��3 ;
.
��; <
SingleOrDefault
��< K
(
��K L
p
��L M
=>
��N P
p
��Q R
.
��R S
UserId
��S Y
==
��Z \
user
��] a
.
��a b
UserId
��b h
&&
��i k
p
��l m
.
��m n
PasswordName
��n z
==
��{ }
passwordName��~ �
)��� �
;��� �
if
�� 
(
�� 
existingPassword
��  
==
��! #
null
��$ (
)
��( )
{
�� 
return
�� 
$str
�� +
;
��+ ,
}
�� 
user
�� 
.
�� 
	Passwords
�� 
.
�� 
Remove
�� !
(
��! "
existingPassword
��" 2
)
��2 3
;
��3 4

_dbContext
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
$"
�� 
$str
�� 
{
�� 
passwordName
�� *
}
��* +
"
��+ ,
;
��, -
}
�� 	
string
�� 
IPasswordService
�� 
.
��   
DeleteAllPasswords
��  2
(
��2 3
string
��3 9
phoneId
��: A
)
��A B
{
�� 	
var
�� 
user
�� 
=
�� 

_dbContext
�� !
.
��! "
Users
��" '
.
��' (
SingleOrDefault
��( 7
(
��7 8
u
��8 9
=>
��: <
u
��= >
.
��> ?
PhoneId
��? F
==
��G I
phoneId
��J Q
)
��Q R
;
��R S
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
$str
�� '
;
��' (
}
�� 
List
�� 
<
�� 
Password
�� 
>
�� 
existingPasswords
�� ,
=
��- .

_dbContext
��/ 9
.
��9 :
Password
��: B
.
��B C
Where
��C H
(
��H I
p
��I J
=>
��K M
p
��N O
.
��O P
UserId
��P V
==
��W Y
user
��Z ^
.
��^ _
UserId
��_ e
)
��e f
.
��f g
ToList
��g m
(
��m n
)
��n o
;
��o p
int
�� 
totalPasswords
�� 
=
��  
existingPasswords
��! 2
.
��2 3
Count
��3 8
;
��8 9
if
�� 
(
�� 
totalPasswords
�� 
<
��  
$num
��! "
)
��" #
{
�� 
return
�� 
$str
�� +
;
��+ ,
}
�� 

_dbContext
�� 
.
�� 
Password
�� 
.
��  
RemoveRange
��  +
(
��+ ,
existingPasswords
��, =
)
��= >
;
��> ?

_dbContext
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
$"
�� 
$str
�� ,
{
��, -
totalPasswords
��- ;
}
��; <
$str
��< =
"
��= >
;
��> ?
}
�� 	
string
�� 
IPasswordService
�� 
.
��  
PasswordCount
��  -
(
��- .
string
��. 4
phoneId
��5 <
)
��< =
{
�� 	
var
�� 
user
�� 
=
�� 

_dbContext
�� !
.
��! "
Users
��" '
.
��' (
SingleOrDefault
��( 7
(
��7 8
u
��8 9
=>
��: <
u
��= >
.
��> ?
PhoneId
��? F
==
��G I
phoneId
��J Q
)
��Q R
;
��R S
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
$str
�� '
;
��' (
}
�� 
List
�� 
<
�� 
Password
�� 
>
�� 
existingPasswords
�� ,
=
��- .

_dbContext
��/ 9
.
��9 :
Password
��: B
.
��B C
Where
��C H
(
��H I
p
��I J
=>
��K M
p
��N O
.
��O P
UserId
��P V
==
��W Y
user
��Z ^
.
��^ _
UserId
��_ e
)
��e f
.
��f g
ToList
��g m
(
��m n
)
��n o
;
��o p
return
�� 
existingPasswords
�� $
.
��$ %
Count
��% *
(
��* +
)
��+ ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
;
��7 8
}
�� 	
string
�� 
IPasswordService
�� 
.
��  
EditPasswordName
��  0
(
��0 1
string
��1 7
phoneId
��8 ?
,
��? @
string
��A G
passwordName
��H T
,
��T U
string
��V \
newPasswordName
��] l
)
��l m
{
�� 	
var
�� 
user
�� 
=
�� 

_dbContext
�� !
.
��! "
Users
��" '
.
��' (
SingleOrDefault
��( 7
(
��7 8
u
��8 9
=>
��: <
u
��= >
.
��> ?
PhoneId
��? F
==
��G I
phoneId
��J Q
)
��Q R
;
��R S
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
$str
�� '
;
��' (
}
�� 
Password
�� 
existingPassword
�� %
=
��& '

_dbContext
��( 2
.
��2 3
Password
��3 ;
.
��; <
SingleOrDefault
��< K
(
��K L
p
��L M
=>
��N P
p
��Q R
.
��R S
UserId
��S Y
==
��Z \
user
��] a
.
��a b
UserId
��b h
&&
��i k
p
��l m
.
��m n
PasswordName
��n z
==
��{ }
passwordName��~ �
)��� �
;��� �
if
�� 
(
�� 
existingPassword
��  
==
��! #
null
��$ (
)
��( )
{
�� 
return
�� 
$str
�� +
;
��+ ,
}
�� 
existingPassword
�� 
.
�� 
PasswordName
�� )
=
��* +
newPasswordName
��, ;
;
��; <

_dbContext
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
$"
�� 
$str
�� 0
{
��0 1
passwordName
��1 =
}
��= >
$str
��> B
{
��B C
newPasswordName
��C R
}
��R S
$str
��S T
"
��T U
;
��U V
}
�� 	
private
�� 
const
�� 
string
�� 
EncryptionKey
�� *
=
��+ ,
$str
��- G
;
��G H
string
�� 
IPasswordService
�� 
.
��  
EncryptPassword
��  /
(
��/ 0
string
��0 6
password
��7 ?
)
��? @
{
�� 	
byte
�� 
[
�� 
]
�� 

clearBytes
�� 
=
�� 
Encoding
��  (
.
��( )
Unicode
��) 0
.
��0 1
GetBytes
��1 9
(
��9 :
password
��: B
)
��B C
;
��C D
using
�� 
(
�� 
Aes
�� 
	encryptor
��  
=
��! "
Aes
��# &
.
��& '
Create
��' -
(
��- .
)
��. /
)
��/ 0
{
��  
Rfc2898DeriveBytes
�� "
pdb
��# &
=
��' (
new
��) , 
Rfc2898DeriveBytes
��- ?
(
��? @
EncryptionKey
��@ M
,
��M N
new
��O R
byte
��S W
[
��W X
]
��X Y
{
��Z [
$num
�� 
,
�� 
$num
�� 
,
�� 
$num
��  
,
��  !
$num
��" &
,
��& '
$num
��( ,
,
��, -
$num
��. 2
,
��2 3
$num
��4 8
,
��8 9
$num
��: >
,
��> ?
$num
��@ D
,
��D E
$num
��F J
,
��J K
$num
��L P
,
��P Q
$num
��R V
,
��V W
$num
��X \
}
�� 
)
�� 
;
�� 
	encryptor
�� 
.
�� 
Key
�� 
=
�� 
pdb
��  #
.
��# $
GetBytes
��$ ,
(
��, -
$num
��- /
)
��/ 0
;
��0 1
	encryptor
�� 
.
�� 
IV
�� 
=
�� 
pdb
�� "
.
��" #
GetBytes
��# +
(
��+ ,
$num
��, .
)
��. /
;
��/ 0
using
�� 
(
�� 
MemoryStream
�� #
ms
��$ &
=
��' (
new
��) ,
MemoryStream
��- 9
(
��9 :
)
��: ;
)
��; <
{
�� 
using
�� 
(
�� 
CryptoStream
�� '
cs
��( *
=
��+ ,
new
��- 0
CryptoStream
��1 =
(
��= >
ms
��> @
,
��@ A
	encryptor
��B K
.
��K L
CreateEncryptor
��L [
(
��[ \
)
��\ ]
,
��] ^
CryptoStreamMode
��_ o
.
��o p
Write
��p u
)
��u v
)
��v w
{
�� 
cs
�� 
.
�� 
Write
��  
(
��  !

clearBytes
��! +
,
��+ ,
$num
��- .
,
��. /

clearBytes
��0 :
.
��: ;
Length
��; A
)
��A B
;
��B C
cs
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
}
�� 
return
�� 
Convert
�� "
.
��" #
ToBase64String
��# 1
(
��1 2
ms
��2 4
.
��4 5
ToArray
��5 <
(
��< =
)
��= >
)
��> ?
;
��? @
}
�� 
}
�� 
}
�� 	
private
��	 
static
�� 
string
�� 
DecryptPassword
�� .
(
��. /
string
��/ 5
encryptedPassword
��6 G
)
��G H
{
�� 	
byte
�� 
[
�� 
]
�� 
cipherBytes
�� 
=
��  
Convert
��! (
.
��( )
FromBase64String
��) 9
(
��9 :
encryptedPassword
��: K
)
��K L
;
��L M
using
�� 
(
�� 
Aes
�� 
	encryptor
��  
=
��! "
Aes
��# &
.
��& '
Create
��' -
(
��- .
)
��. /
)
��/ 0
{
��  
Rfc2898DeriveBytes
�� "
pdb
��# &
=
��' (
new
��) , 
Rfc2898DeriveBytes
��- ?
(
��? @
EncryptionKey
��@ M
,
��M N
new
��O R
byte
��S W
[
��W X
]
��X Y
{
��Z [
$num
�� 
,
�� 
$num
�� 
,
�� 
$num
��  
,
��  !
$num
��" &
,
��& '
$num
��( ,
,
��, -
$num
��. 2
,
��2 3
$num
��4 8
,
��8 9
$num
��: >
,
��> ?
$num
��@ D
,
��D E
$num
��F J
,
��J K
$num
��L P
,
��P Q
$num
��R V
,
��V W
$num
��X \
}
�� 
)
�� 
;
�� 
	encryptor
�� 
.
�� 
Key
�� 
=
�� 
pdb
��  #
.
��# $
GetBytes
��$ ,
(
��, -
$num
��- /
)
��/ 0
;
��0 1
	encryptor
�� 
.
�� 
IV
�� 
=
�� 
pdb
�� "
.
��" #
GetBytes
��# +
(
��+ ,
$num
��, .
)
��. /
;
��/ 0
using
�� 
(
�� 
MemoryStream
�� #
ms
��$ &
=
��' (
new
��) ,
MemoryStream
��- 9
(
��9 :
)
��: ;
)
��; <
{
�� 
using
�� 
(
�� 
CryptoStream
�� '
cs
��( *
=
��+ ,
new
��- 0
CryptoStream
��1 =
(
��= >
ms
��> @
,
��@ A
	encryptor
��B K
.
��K L
CreateDecryptor
��L [
(
��[ \
)
��\ ]
,
��] ^
CryptoStreamMode
��_ o
.
��o p
Write
��p u
)
��u v
)
��v w
{
�� 
cs
�� 
.
�� 
Write
��  
(
��  !
cipherBytes
��! ,
,
��, -
$num
��. /
,
��/ 0
cipherBytes
��1 <
.
��< =
Length
��= C
)
��C D
;
��D E
cs
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
}
�� 
return
�� 
Encoding
�� #
.
��# $
Unicode
��$ +
.
��+ ,
	GetString
��, 5
(
��5 6
ms
��6 8
.
��8 9
ToArray
��9 @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �
qC:\Users\rhysm\Projects\EAD2\server\PasswordManager\PasswordManagerAPI\PasswordManagerAPI\Services\UserService.cs
	namespace 	
PasswordManagerAPI
 
. 
Services %
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private		 
readonly		 "
PasswordManagerContext		 /

_dbContext		0 :
;		: ;
public 
UserService 
( "
PasswordManagerContext 1
	dbContext2 ;
); <
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
string 

DeleteUser  
(  !
string! '
phoneId( /
)/ 0
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
public 
object 
GetUser 
( 
string $
phoneId% ,
), -
{ 	
var 
user 
= 

_dbContext !
.! "
Users" '
.' (
Where( -
(- .
u. /
=>0 2
u3 4
.4 5
PhoneId5 <
=== ?
phoneId@ G
)G H
.H I
SelectI O
(O P
uP Q
=>R T
newU X
{ 
u 
. 
UserId 
, 
u 
. 
PhoneId 
} 
) 
. 
FirstOrDefault 
( 
) 
;  
return   
user   
;   
}"" 	
public$$ 
string$$ 

UpdateUser$$  
($$  !
User$$! %
user$$& *
)$$* +
{%% 	
throw&& 
new&& #
NotImplementedException&& -
(&&- .
)&&. /
;&&/ 0
}'' 	
public)) 
string)) 
AddUser)) 
()) 
string)) $
phoneId))% ,
))), -
{** 	
User++ 
user++ 
=++ 
new++ 
User++  
(++  !
phoneId++! (
=++( )
phoneId++) 0
)++0 1
;++1 2

_dbContext,, 
.,, 
Users,, 
.,, 
Add,,  
(,,  !
user,,! %
),,% &
;,,& '

_dbContext-- 
.-- 
SaveChanges-- "
(--" #
)--# $
;--$ %
return.. 
$str.. 
;..  
}// 	
}00 
}11 