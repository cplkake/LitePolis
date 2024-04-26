CREATE DATABASE IF NOT EXISTS litepolis;

USE litepolis;

CREATE TABLE IF NOT EXISTS userdata (
    ID INT NOT NULL AUTO_INCREMENT,
    EMAIL STRING NOT NULL,
    PASSWORD STRING NOT NULL,
    PRIVILEGE STRING DEFAULT "user"
)
PRIMARY KEY (ID)
DISTRIBUTED BY HASH(ID);

CREATE TABLE IF NOT EXISTS conversationdata (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME STRING NOT NULL,
    DESCRIPTION STRING,
    CREATOR_ID INT NOT NULL
)
PRIMARY KEY (ID)
FOREIGN KEY (CREATOR_ID) REFERENCES userdata(ID);

CREATE TABLE IF NOT EXISTS commentdata (
    ID INT NOT NULL AUTO_INCREMENT,
    CREATE_DATE DATETIME,
    COMMENT STRING NOT NULL,
    USER_ID INT NOT NULL,
    CONVERSATION_ID INT NOT NULL,
    MODERATED BOOLEAN DEFAULT FALSE,
    APPROVED BOOLEAN DEFAULT FALSE
)
PRIMARY KEY (ID)
FOREIGN KEY (USER_ID) REFERENCES userdata(ID);
FOREIGN KEY (CONVERSATION_ID) REFERENCES conversationdata(ID);

CREATE TABLE IF NOT EXISTS apikeys (
    API_KEY STRING NOT NULL,
    USER_ID INT NOT NULL
)
PRIMARY KEY (API_KEY)
FOREIGN KEY (USER_ID) REFERENCES userdata(ID);
