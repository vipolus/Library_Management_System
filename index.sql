CREATE INDEX idx_user ON User (username);
CREATE INDEX idx_Title ON Book (Title);
CREATE INDEX idx_full_name_auth ON Author (Last_name, First_name);

CREATE VIEW user_vw
(User_id, first_name, last_name, email)
AS
SELECT
 customer_id, First_name, Last_name,
 concat(substr(email,1,2), '*****', substr(email, -4)) email
FROM customer;
