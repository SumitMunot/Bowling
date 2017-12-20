# Bowling
Strike! is a bowling club. They need help to keep score automatically on competitions and avoid human errors from the judges. On competitions there are 10 casings considerd as casings. In each casing the player has the opportunity to try to take down the pins twice and there are 10 pins on the start of each try. 

## Rules
- The user hits less than max score pin during 2 tries on the same casing, then score is the sum of the pins they’ve hit in the 2 attempts.
- The user hits all the pins during 2 tries on the same casing his/her score is the sum of the pins hited on the spare,vplus the number of pins hited in the next try.
- The user hits all pins on the first try, users score is the sum of pins hited on the strike plus the number of pins hited on the next 2 tries.


## Deployment

Heroku URL: ```http://bowling-strike-the-game.herokuapp.com/```

## Steps for Playing the game

* Open browser app url:```http://bowling-strike-the-game.herokuapp.com/```
* Go to home page
* Add players for first timers.
* After adding players, goto home page and lets start playing
* Click on new game and choose players/player for game
* Click on play your turn
* Start your turns and enter the tries and turn info in each casing.
* Click on create casing
* Continue same for other players.
* Once the game hits 10th turn , the game is finished
* Go to game dashboard to check for winner and score
* you can also go to the dashboard in between the play to check winners and score for present turn
* In each game card of game dashboard the ```Check full score here``` is there which will bring you back to player dashboard
* You can check the dashboard for Multiple Games

## Note

* Bowling is only for 10 turns and no bonus trun is there for special case.
* Boling in future can be extended for the implementation of bonus casing.
* Bowling works best in All browsers, avoid using IE.
