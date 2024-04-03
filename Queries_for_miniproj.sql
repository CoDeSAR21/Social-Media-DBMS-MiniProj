use miniprojectfinal;

ALTER TABLE Users MODIFY Password VARCHAR(100) NOT NULL;

SELECT * FROM Posts WHERE PostID >= 7;

UPDATE Posts SET LikesCount = LikesCount + 1 WHERE PostID >= 7;

SELECT * FROM Posts WHERE PostID >= 7;

SELECT UserID FROM Likes
UNION
SELECT UserID FROM Comments;

SELECT SUM(LikesCount) AS TotalLikes FROM Posts WHERE PostID <= 6;

SELECT * FROM Users WHERE UserID IN 
(
    SELECT UserID
    FROM Posts
    WHERE LikesCount <= 50
);

SELECT Comments.CommentID, Comments.CommentText, Comments.UserID FROM Comments
JOIN 
Users ON Comments.UserID = Users.UserID;

SELECT AVG(LikesCount) AS AvgLikesPerPost FROM Posts WHERE LikesCount > 15;

SELECT * FROM Posts WHERE PostID IN 
(
    SELECT PostID FROM Likes WHERE UserID = (
        SELECT UserID FROM Users WHERE Username = 'user2'
    )
);

SELECT * FROM Posts WHERE UserID = (
    SELECT UserID FROM Users WHERE Username = 'user5'
);

SELECT Users.Username FROM Users
JOIN Likes 
ON Users.UserID = Likes.UserID
WHERE Likes.PostID = 7;

SELECT Users.Username, Posts.Caption FROM Users 
JOIN Posts ON Users.UserID = Posts.UserID;

UPDATE Posts SET Caption = 'Updated caption' WHERE PostID = 7;

SELECT * FROM Posts WHERE PostID = 7;

SELECT Eventss.EventName, COUNT(Event_Participants.ParticipantID) AS TotalParticipants
FROM Eventss
JOIN Event_Participants ON Eventss.EventID = Event_Participants.EventID
GROUP BY Eventss.EventID;








