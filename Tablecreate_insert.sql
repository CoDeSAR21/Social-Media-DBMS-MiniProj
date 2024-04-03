create database miniprojectfinal;
use miniprojectfinal;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100),
    FullName VARCHAR(100),
    Bio TEXT,
    ProfilePictureURL VARCHAR(255),
    RegistrationDate DATE,
    LastLoginDate DATE,
    AccountType VARCHAR(20)
);

INSERT INTO Users VALUES 
(1, 'user1', 'user1@example.com', 'password1', 'User One', 'Bio of User One', 'profile1.jpg', '2024-01-01', '2024-01-01', 'personal'),
(2, 'user2', 'user2@example.com', 'password2', 'User Two', 'Bio of User Two', 'profile2.jpg', '2024-01-02', '2024-01-02', 'business'),
(3, 'user3', 'user3@example.com', 'password3', 'User Three', 'Bio of User Three', 'profile3.jpg', '2024-01-03', '2024-01-03', 'personal'),
(4, 'user4', 'user4@example.com', 'password4', 'User Four', 'Bio of User Four', 'profile4.jpg', '2024-01-04', '2024-01-04', 'business'),
(5, 'user5', 'user5@example.com', 'password5', 'User Five', 'Bio of User Five', 'profile5.jpg', '2024-01-05', '2024-01-05', 'personal'),
(6, 'user6', 'user6@example.com', 'password6', 'User Six', 'Bio of User Six', 'profile6.jpg', '2024-01-06', '2024-01-06', 'business'),
(7, 'user7', 'user7@example.com', 'password7', 'User Seven', 'Bio of User Seven', 'profile7.jpg', '2024-01-07', '2024-01-07', 'personal'),
(8, 'user8', 'user8@example.com', 'password8', 'User Eight', 'Bio of User Eight', 'profile8.jpg', '2024-01-08', '2024-01-08', 'business'),
(9, 'user9', 'user9@example.com', 'password9', 'User Nine', 'Bio of User Nine', 'profile9.jpg', '2024-01-09', '2024-01-09', 'personal'),
(10, 'user10', 'user10@example.com', 'password10', 'User Ten', 'Bio of User Ten', 'profile10.jpg', '2024-01-10', '2024-01-10', 'business');

CREATE TABLE Posts (   
    PostID INT PRIMARY KEY,
    UserID INT,
    Caption TEXT,
    MediaURL VARCHAR(255),
    PostDate DATE,
    LikesCount INT,
    CommentsCount INT,
    ShareCount INT,
    Location VARCHAR(100),
    Visibility VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Posts VALUES
(1, 1, 'First post caption', 'media1.jpg', '2024-01-01', 10, 5, 3, 'New York', 'public'),
(2, 2, 'Second post caption', 'media2.jpg', '2024-01-02', 20, 8, 2, 'Los Angeles', 'public'),
(3, 3, 'Third post caption', 'media3.jpg', '2024-01-03', 15, 7, 4, 'Chicago', 'public'),
(4, 4, 'Fourth post caption', 'media4.jpg', '2024-01-04', 25, 9, 5, 'Houston', 'public'),
(5, 5, 'Fifth post caption', 'media5.jpg', '2024-01-05', 35, 11, 6, 'Miami', 'public'),
(6, 6, 'Sixth post caption', 'media6.jpg', '2024-01-06', 45, 13, 7, 'Seattle', 'public'),
(7, 7, 'Seventh post caption', 'media7.jpg', '2024-01-07', 55, 15, 8, 'Boston', 'public'),
(8, 8, 'Eighth post caption', 'media8.jpg', '2024-01-08', 65, 17, 9, 'San Francisco', 'public'),
(9, 9, 'Ninth post caption', 'media9.jpg', '2024-01-09', 75, 19, 10, 'Washington DC', 'public'),
(10, 10, 'Tenth post caption', 'media10.jpg', '2024-01-10', 85, 21, 11, 'Dallas', 'public');

CREATE TABLE Comments ( 
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CommentText TEXT,
    CommentDate DATE,
    LikesCount INT,
    ReplyTo INT,
    HashtagCount INT,
    MentionedUsersCount INT,
    Location VARCHAR(100),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReplyTo) REFERENCES Comments(CommentID)
);

INSERT INTO Comments VALUES
(1, 1, 2, 'Nice post!', '2024-01-01', 2, NULL, 1, 0, NULL),
(2, 2, 1, 'Great shot!', '2024-01-02', 3, NULL, 0, 0, NULL),
(3, 3, 4, 'Another great post!', '2024-01-03', 3, NULL, 1, 0, NULL),
(4, 4, 5, 'Nice shot!', '2024-01-04', 4, NULL, 0, 0, NULL),
(5, 5, 6, 'Awesome!', '2024-01-05', 5, NULL, 0, 0, NULL),
(6, 6, 7, 'Love it!', '2024-01-06', 6, NULL, 0, 0, NULL),
(7, 7, 8, 'Cool!', '2024-01-07', 7, NULL, 0, 0, NULL),
(8, 8, 9, 'Great content!', '2024-01-08', 8, NULL, 0, 0, NULL),
(9, 9, 10, 'Keep it up!', '2024-01-09', 9, NULL, 0, 0, NULL),
(10, 10, 1, 'Fantastic!', '2024-01-10', 10, NULL, 0, 0, NULL);


CREATE TABLE Likes (    
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    LikeDate DATE,
    LikeType VARCHAR(20),
    DeviceType VARCHAR(50),
    IPAddress VARCHAR(50),
    Geolocation VARCHAR(100),
    PrivacySettings VARCHAR(20),
    NotificationStatus VARCHAR(20),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Likes VALUES
(1, 1, 2, '2024-01-01', 'like', 'Desktop', '192.168.1.1', 'New York', 'public', 'enabled'),
(2, 2, 1, '2024-01-02', 'love', 'Mobile', '192.168.1.2', 'Los Angeles', 'public', 'enabled'),
(3, 3, 5, '2024-01-03', 'like', 'Desktop', '192.168.1.3', 'Chicago', 'public', 'enabled'),
(4, 4, 6, '2024-01-04', 'love', 'Mobile', '192.168.1.4', 'Houston', 'public', 'enabled'),
(5, 5, 7, '2024-01-05', 'like', 'Desktop', '192.168.1.5', 'Miami', 'public', 'enabled'),
(6, 6, 8, '2024-01-06', 'like', 'Mobile', '192.168.1.6', 'Seattle', 'public', 'enabled'),
(7, 7, 9, '2024-01-07', 'love', 'Desktop', '192.168.1.7', 'Boston', 'public', 'enabled'),
(8, 8, 10, '2024-01-08', 'like', 'Mobile', '192.168.1.8', 'San Francisco', 'public', 'enabled'),
(9, 9, 1, '2024-01-09', 'like', 'Desktop', '192.168.1.9', 'Washington DC', 'public', 'enabled'),
(10, 10, 2, '2024-01-10', 'love', 'Mobile', '192.168.1.10', 'Dallas', 'public', 'enabled');


CREATE TABLE Follows (       
    FollowID INT PRIMARY KEY,
    FollowerUserID INT,
    FollowedUserID INT,
    FollowDate DATE,
    FollowType VARCHAR(20),
    Status VARCHAR(20),
    PrivacySettings VARCHAR(20),
    NotificationStatus VARCHAR(20),
    LastInteractionDate DATE,
    RelationshipStrength VARCHAR(20),
    FOREIGN KEY (FollowerUserID) REFERENCES Users(UserID),
    FOREIGN KEY (FollowedUserID) REFERENCES Users(UserID)
);

INSERT INTO Follows VALUES
(1, 1, 2, '2024-01-01', 'follow', 'active', 'public', 'enabled', '2024-01-01', 'strong'),
(2, 2, 1, '2024-01-02', 'follow', 'active', 'public', 'enabled', '2024-01-02', 'medium'),
(3, 3, 4, '2024-01-03', 'follow', 'active', 'public', 'enabled', '2024-01-03', 'strong'),
(4, 4, 5, '2024-01-04', 'follow', 'active', 'public', 'enabled', '2024-01-04', 'medium'),
(5, 5, 6, '2024-01-05', 'follow', 'active', 'public', 'enabled', '2024-01-05', 'strong'),
(6, 6, 7, '2024-01-06', 'follow', 'active', 'public', 'enabled', '2024-01-06', 'medium'),
(7, 7, 8, '2024-01-07', 'follow', 'active', 'public', 'enabled', '2024-01-07', 'strong'),
(8, 8, 9, '2024-01-08', 'follow', 'active', 'public', 'enabled', '2024-01-08', 'medium'),
(9, 9, 10, '2024-01-09', 'follow', 'active', 'public', 'enabled', '2024-01-09', 'strong'),
(10, 10, 1, '2024-01-10', 'follow', 'active', 'public', 'enabled', '2024-01-10', 'medium');

CREATE TABLE Messages (    
    MessageID INT PRIMARY KEY,
    SenderUserID INT,
    ReceiverUserID INT,
    MessageContent TEXT,
    MessageDate DATE,
    MessageStatus VARCHAR(20),
    AttachmentURL VARCHAR(255),
    Geolocation VARCHAR(100),
    EncryptionType VARCHAR(20),
    MessageType VARCHAR(20),
    FOREIGN KEY (SenderUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverUserID) REFERENCES Users(UserID)
);

INSERT INTO Messages VALUES
(1, 1, 2, 'Hi there!', '2024-01-01', 'delivered', NULL, 'New York', 'AES', 'text'),
(2, 2, 1, 'Hello!', '2024-01-02', 'delivered', NULL, 'Los Angeles', 'AES', 'text'),
(3, 3, 4, 'Hi, how are you?', '2024-01-03', 'delivered', NULL, 'Chicago', 'AES', 'text'),
(4, 4, 5, 'Hello!', '2024-01-04', 'delivered', NULL, 'Houston', 'AES', 'text'),
(5, 5, 6, 'Nice to meet you!', '2024-01-05', 'delivered', NULL, 'Miami', 'AES', 'text'),
(6, 6, 7, 'Good morning!', '2024-01-06', 'delivered', NULL, 'Seattle', 'AES', 'text'),
(7, 7, 8, 'Good afternoon!', '2024-01-07', 'delivered', NULL, 'Boston', 'AES', 'text'),
(8, 8, 9, 'Good evening!', '2024-01-08', 'delivered', NULL, 'San Francisco', 'AES', 'text'),
(9, 9, 10, 'Good night!', '2024-01-09', 'delivered', NULL, 'Washington DC', 'AES', 'text'),
(10, 10, 1, 'How are you doing?', '2024-01-10', 'delivered', NULL, 'Dallas', 'AES', 'text');

CREATE TABLE Stories (      
    StoryID INT PRIMARY KEY,
    UserID INT,
    StoryURL VARCHAR(255),
    StoryDate DATE,
    ViewCount INT,
    LikeCount INT,
    ShareCount INT,
    Location VARCHAR(100),
    ExpiryDate DATE,
    PrivacySettings VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Stories VALUES
(1, 1, 'story1.jpg', '2024-01-01', 100, 50, 20, 'New York', '2024-01-02', 'public'),
(2, 2, 'story2.jpg', '2024-01-02', 120, 60, 30, 'Los Angeles', '2024-01-03', 'public'),
(3, 3, 'story3.jpg', '2024-01-03', 100, 50, 20, 'Chicago', '2024-01-04', 'public'),
(4, 4, 'story4.jpg', '2024-01-04', 120, 60, 30, 'Houston', '2024-01-05', 'public'),
(5, 5, 'story5.jpg', '2024-01-05', 140, 70, 40, 'Miami', '2024-01-06', 'public'),
(6, 6, 'story6.jpg', '2024-01-06', 160, 80, 50, 'Seattle', '2024-01-07', 'public'),
(7, 7, 'story7.jpg', '2024-01-07', 180, 90, 60, 'Boston', '2024-01-08', 'public'),
(8, 8, 'story8.jpg', '2024-01-08', 200, 100, 70, 'San Francisco', '2024-01-09', 'public'),
(9, 9, 'story9.jpg', '2024-01-09', 220, 110, 80, 'Washington DC', '2024-01-10', 'public'),
(10, 10, 'story10.jpg', '2024-01-10', 240, 120, 90, 'Dallas', '2024-01-11', 'public');

CREATE TABLE Notifications (        
    NotificationID INT PRIMARY KEY,
    UserID INT,
    NotificationText TEXT,
    NotificationType VARCHAR(20),
    NotificationDate DATE,
    SenderUserID INT,
    PostID INT,
    ReadStatus VARCHAR(20),
    NotificationStatus VARCHAR(20),
    ActionURL VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SenderUserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

INSERT INTO Notifications VALUES
(1, 2, 'You have a new like', 'like', '2024-01-01', 1, 1, 'unread', 'active', 'post1.html'),
(2, 1, 'You have a new comment', 'comment', '2024-01-02', 2, 2, 'unread', 'active', 'post2.html'),
(3, 4, 'You have a new like', 'like', '2024-01-03', 3, 3, 'unread', 'active', 'post3.html'),
(4, 5, 'You have a new comment', 'comment', '2024-01-04', 4, 4, 'unread', 'active', 'post4.html'),
(5, 6, 'You have a new like', 'like', '2024-01-05', 5, 5, 'unread', 'active', 'post5.html'),
(6, 7, 'You have a new comment', 'comment', '2024-01-06', 6, 6, 'unread', 'active', 'post6.html'),
(7, 8, 'You have a new like', 'like', '2024-01-07', 7, 7, 'unread', 'active', 'post7.html'),
(8, 9, 'You have a new comment', 'comment', '2024-01-08', 8, 8, 'unread', 'active', 'post8.html'),
(9, 10, 'You have a new like', 'like', '2024-01-09', 9, 9, 'unread', 'active', 'post9.html'),
(10, 1, 'You have a new comment', 'comment', '2024-01-10', 10, 10, 'unread', 'active', 'post10.html');

CREATE TABLE Reports (        
    ReportID INT PRIMARY KEY,
    ReporterUserID INT,
    ReportedUserID INT,
    ReportedPostID INT,
    ReportDate DATE,
    ReportType VARCHAR(20),
    ReportDescription TEXT,
    ReportStatus VARCHAR(20),
    ModeratorUserID INT,
    ActionTaken TEXT,
    FOREIGN KEY (ReporterUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReportedUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReportedPostID) REFERENCES Posts(PostID),
    FOREIGN KEY (ModeratorUserID) REFERENCES Users(UserID)
);

INSERT INTO Reports VALUES
(1, 1, 2, 1, '2024-01-01', 'spam', 'Inappropriate content', 'open', 3, NULL),
(2, 2, 1, 2, '2024-01-02', 'harassment', 'Abusive behavior', 'open', 4, NULL),
(3, 2, 3, 3, '2024-01-03', 'spam', 'Inappropriate content', 'open', 4, NULL),
(4, 3, 4, 4, '2024-01-04', 'harassment', 'Abusive behavior', 'open', 5, NULL),
(5, 4, 5, 5 ,'2024-01-05', 'spam', 'Inappropriate content', 'open', 6, NULL),
(6, 5, 6, 6, '2024-01-06', 'harassment', 'Abusive behavior', 'open', 7, NULL),
(7, 6, 7,7, '2024-01-07', 'spam', 'Inappropriate content', 'open', 8, NULL),
(8, 7, 8,8, '2024-01-08', 'harassment', 'Abusive behavior', 'open', 9, NULL),
(9, 8, 9, 9, '2024-01-09', 'spam', 'Inappropriate content', 'open', 10, NULL),
(10, 9, 10,10, '2024-01-10', 'harassment', 'Abusive behavior', 'open', 1, NULL);

CREATE TABLE Tagss (          
    TagID INT PRIMARY KEY,
    TagName VARCHAR(50),
    TagDescription TEXT,
    TaggedUserID INT,
    TaggedPostID INT,
    TaggedCommentID INT,
    TaggedStoryID INT,
    TaggedMessageID INT,
    TaggedNotificationID INT,
    TaggedReportID INT,
    FOREIGN KEY (TaggedUserID) REFERENCES Users(UserID),
    FOREIGN KEY (TaggedPostID) REFERENCES Posts(PostID),
    FOREIGN KEY (TaggedCommentID) REFERENCES Comments(CommentID),
    FOREIGN KEY (TaggedStoryID) REFERENCES Stories(StoryID),
    FOREIGN KEY (TaggedMessageID) REFERENCES Messages(MessageID),
    FOREIGN KEY (TaggedNotificationID) REFERENCES Notifications(NotificationID),
    FOREIGN KEY (TaggedReportID) REFERENCES Reports(ReportID)
);


INSERT INTO Tagss VALUES
(1, 'UserTag', 'Tagging user in a post', 2, 1,1, 1, 1, 1, 1),
(2, 'PostTag', 'Tagging post in a comment', 2, 2, 2, 2,2, 2, 2),
(3, 'userTag', 'Tagging a user in a post', 4, 3 ,3, 3, 3, 3, 3),
(4, 'postTag', 'Tagging a post in a comment', 4, 4,4, 4, 4, 4, 4),
(5, 'userTag', 'Tagging a user in a post', 5, 5, 5, 5, 5, 5, 5),
(6, 'postTag', 'Tagging a post in a comment', 6, 6, 6, 6, 6, 6, 6),
(7, 'userTag', 'Tagging a user in a post', 6, 7,7,7 ,7, 7, 7),
(8, 'postTag', 'Tagging a post in a comment', 8, 8,8, 8, 8, 8, 8),
(9, 'userTag', 'Tagging a user in a post', 7, 9,9, 9, 9, 9, 9),
(10, 'postTag', 'Tagging a post in a comment',10, 10, 10, 10, 10, 10, 10);

CREATE TABLE Groupss (          
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100),
    GroupDescription TEXT,
    GroupAdminUserID INT,
    GroupCreationDate DATE,
    GroupPrivacy VARCHAR(20),
    GroupCategory VARCHAR(50),
    GroupMembersCount INT,
    GroupStatus VARCHAR(20),
    GroupProfilePictureURL VARCHAR(255),
    FOREIGN KEY (GroupAdminUserID) REFERENCES Users(UserID)
);

INSERT INTO Groupss VALUES
(1, 'nmunofficial', 'nmims ce a div unofficial group for studies', 1, '2024-01-01', 'public', 'Social', 10, 'active', 'group1.jpg'),
(2, 'mbpics', 'mahableshwar trip pics', 2, '2024-01-02', 'private', 'Photography', 20, 'active', 'group2.jpg'),
(3, 'Ai geeks', 'ai innovation and ideas to be shared here', 3, '2024-01-03', 'public', 'Technology', 30, 'active', 'group3.jpg'),
(4, 'sp2024', 'singapore trip ', 4, '2024-01-04', 'private', 'Travel', 40, 'active', 'group4.jpg'),
(5, 'khanakhazana', 'different recipies to be shared here', 5, '2024-01-05', 'public', 'Food', 50, 'active', 'group5.jpg'),
(6, 'gymwaale', 'nutrion and training tips to be shared here', 6, '2024-01-06', 'private', 'Fitness', 60, 'active', 'group6.jpg'),
(7, 'darjee', 'innovative and creative fashion designs', 7, '2024-01-07', 'public', 'Fashion', 70, 'active', 'group7.jpg'),
(8, 'Indian Idull', 'singers and music enthusiasts welcomed', 8, '2024-01-08', 'private', 'Art', 80, 'active', 'group8.jpg'),
(9, 'GKapiva', 'kapiva nutrition product description', 9, '2024-01-09', 'public', 'fitness', 90, 'active', 'group9.jpg'),
(10, 'S8ul gaming', 'gaming brand since 2018', 10, '2024-01-10', 'private', 'Gaming', 100, 'active', 'group10.jpg');

CREATE TABLE Group_Members (      
    GroupMemberID INT PRIMARY KEY,
    GroupID INT,
    MemberUserID INT,
    JoinDate DATE,
    MemberRole VARCHAR(20),
    MemberStatus VARCHAR(20),
    LastActiveDate DATE,
    NotificationsEnabled BOOLEAN,
    GroupVisibility VARCHAR(20),
    GroupNotificationSettings VARCHAR(20),
    FOREIGN KEY (GroupID) REFERENCES Groupss(GroupID),
    FOREIGN KEY (MemberUserID) REFERENCES Users(UserID)
);

INSERT INTO Group_Members VALUES
(1, 1, 2, '2024-01-01', 'member', 'active', '2024-01-01', true, 'visible', 'enabled'),
(2, 2, 1, '2024-01-02', 'admin', 'active', '2024-01-02', true, 'hidden', 'enabled'),
(3, 3, 4, '2024-01-03', 'member', 'active', '2024-01-03', true, 'visible', 'enabled'),
(4, 4, 5, '2024-01-04', 'member', 'active', '2024-01-04', true, 'visible', 'enabled'),
(5, 5, 6, '2024-01-05', 'member', 'active', '2024-01-05', true, 'visible', 'enabled'),
(6, 6, 7, '2024-01-06', 'member', 'active', '2024-01-06', true, 'visible', 'enabled'),
(7, 7, 8, '2024-01-07', 'member', 'active', '2024-01-07', true, 'visible', 'enabled'),
(8, 8, 9, '2024-01-08', 'member', 'active', '2024-01-08', true, 'visible', 'enabled'),
(9, 9, 10, '2024-01-09', 'member', 'active', '2024-01-09', true, 'visible', 'enabled'),
(10, 10, 1, '2024-01-10', 'member', 'active', '2024-01-10', true, 'visible', 'enabled');

CREATE TABLE Eventss (         
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDescription TEXT,
    EventOrganizerUserID INT,
    EventStartDate DATE,
    EventEndDate DATE,
    EventLocation VARCHAR(100),
    EventPrivacy VARCHAR(20),
    EventCategory VARCHAR(50),
    EventStatus VARCHAR(20),
    FOREIGN KEY (EventOrganizerUserID) REFERENCES Users(UserID)
);

INSERT INTO Eventss VALUES
(1, 'Event 1', 'webinar', 1, '2024-01-01', '2024-01-02', 'New York', 'public', 'Social', 'active'),
(2, 'Event 2', 'speed dating', 2, '2024-01-03', '2024-01-04', 'Los Angeles', 'private', 'social', 'active'),
(3, 'Event 3', 'trivia', 3, '2024-01-03', '2024-01-04', 'Chicago', 'public', 'Social', 'active'),
(4, 'Event 4', 'pushup challenge', 4, '2024-01-04', '2024-01-05', 'Houston', 'private', 'bodybuilding', 'active'),
(5, 'Event 5', 'bog muscles nutrition live contest', 5, '2024-01-05', '2024-01-06', 'Miami', 'public', 'Food', 'active'),
(6, 'Event 6', 'Nike clearence sale contest', 6, '2024-01-06', '2024-01-07', 'Seattle', 'private', 'Fitness', 'active'),
(7, 'Event 7', 'Live voting for BIG BOSS', 7, '2024-01-07', '2024-01-08', 'Boston', 'public', 'social', 'active'),
(8, 'Event 8', 'onlinr artt exhibition', 8, '2024-01-08', '2024-01-09', 'San Francisco', 'private', 'Art', 'active'),
(9, 'Event 9', 'onine music class live', 9, '2024-01-09', '2024-01-10', 'Washington DC', 'public', 'Music', 'active'),
(10, 'Event 10', 'clash of titans finals broadcast', 10, '2024-01-10', '2024-01-11', 'Dallas', 'private', 'Gaming', 'active');

CREATE TABLE Event_Participants (       
    ParticipantID INT PRIMARY KEY,
    EventID INT,
    ParticipantUserID INT,
    RegistrationDate DATE,
    ParticipantStatus VARCHAR(20),
    LastActiveDate DATE,
    NotificationsEnabled BOOLEAN,
    EventVisibility VARCHAR(20),
    EventNotificationSettings VARCHAR(20),
    FOREIGN KEY (EventID) REFERENCES Eventss(EventID),
    FOREIGN KEY (ParticipantUserID) REFERENCES Users(UserID)
);

INSERT INTO Event_Participants VALUES
(1, 1, 2, '2024-01-01', 'active', '2024-01-01', true, 'visible', 'enabled'),
(2, 2, 1, '2024-01-02', 'active', '2024-01-02', true, 'hidden', 'enabled'),
(3, 3, 4, '2024-01-03', 'active', '2024-01-03', true, 'visible', 'enabled'),
(4, 4, 5, '2024-01-04', 'active', '2024-01-04', true, 'visible', 'enabled'),
(5, 5, 6, '2024-01-05', 'active', '2024-01-05', true, 'visible', 'enabled'),
(6, 6, 7, '2024-01-06', 'active', '2024-01-06', true, 'visible', 'enabled'),
(7, 7, 8, '2024-01-07', 'active', '2024-01-07', true, 'visible', 'enabled'),
(8, 8, 9, '2024-01-08', 'active', '2024-01-08', true, 'visible', 'enabled'),
(9, 9, 10, '2024-01-09', 'active', '2024-01-09', true, 'visible', 'enabled'),
(10, 10, 1, '2024-01-10', 'active', '2024-01-10', true, 'visible', 'enabled');
