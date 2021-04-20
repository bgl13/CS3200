# CS3200 04 SP21 Final Project 
## _Bill (Guanbo) Liu_


### 1. Name of the project
Game Reviews and Mods Database
### 2. Name of the team
Group 38
### 3. Team members and the section they belong to. At most 4 team members per project
Bill (Guanbo) Liu, Section 4
### 4. Brief description of the project
The project will constrcut a database for a community of gamers. In this community you can review video games, post comments on eachother's reviews, and upload mods to share with the community. 
### 5. Link to the latest data model as a single UML class diagram
https://github.com/bgl13/CS3200/blob/a970bafe56aa83c190ae6f88d794f921190a9ce8/db_design_final_project_UML.pdf.pdf
### 6. Description of user data model
The user data model consist a list of user and a series of attributes related to the user:
 - First name
 - Last Name
 - Username
 - Password
 - Email Address
 - Date of Birth
 - Account Created Time
 - Account Last Updated Time

### 7. Description of the domain object data models
#### Games
> Games object represent a video game and the attributes 
> associated with the video game.

Attributes include
- Name of the Game
- Genre of the Game
- Date Game was Created
- Last Time Game was Updated
- Percentage of People that Liked the Game
- Total Player Count in the Community

#### Mods
> A mod (short for "modification") is an alteration by players
> or fans of one or more aspects of a video game, such as how
> it looks or behaves.

Attributes include
- Name of the Mod
- Game the Mod Applies to
- Creator of the Mod
- Up Votes Received from other Users
- Date the Mod was Created
- Last Time the Mod was Updated

#### Game Reviews
> Reviews users give to video games, start with a liked or 
> dislike followed with detailed comments.

Attributes include
- Name of the Game being Reviewed
- Liked or Disliked the Game
- Title of the Review
- Detailed Comment of the Review
- Up Votes Received from other Users
- Down Votes Received from other Users
- Time the Review was Created
- Last Time the Review was Updated

#### Replies
> Replies users give to other users' reviews, one can also
> reply to the reply.

Attributes include
- User Creating the Reply
- Text in the Reply
- Time the Reply was Created
- Last Time the Reply was Updated

### 8. Description of the user to domain object relationship
- User can add a game to the game list for review. 
- User can make a review for an existing game from the game list. 
- User can reply to a review made by another user. 
- User can upload a mod to a game in the game list for other players to download.

### 9. Description of the domain object to domain object relationship
- A game can have many game reviews.
- A game review can have many replies from other user, when a game is deleted the reviews are also deleted. 
- A game can have many mods realted to it, and when a game is deleted the mods are removed.
- A reply can have replies related to the reply.

### 10. Description of the portable enumeration(s)
The object Game has a list of portable enumerations for its genre:
- ACTION
- ADVENTURE
- RPG
- SIMULATION
- STRATEGY
- SPORTS
- MMO 

### 11. Description of the user interface requirements
- User List - displays a list of all users of the community
- User Editor - displays a particular user for editing or allows creating a new user
- Game List - displays a list of all the games
- Game Editor - displays a particular game for editing or allows creating a new game
- Mod List - displays a list of all the mods for a selected game
- Mod Editor - displays a particular mod for editing, updating, or allows creating a new mod for the game
- Review List - displays a list of all reviews for a selected game
- Review Editor - displays a particular review for editing or allows creating a new review for the selected game
- Reply List - displays a list of all the replies to a review
- Reply Editor - displays a particular reply for editing or allows creating a new reply for the review



