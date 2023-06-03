<?php
require_once('config.php');

session_start();

$username = $_SESSION['username'];

if ($username == NULL)
    header('Location: http://localhost/login.php');

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT Approved FROM User WHERE Username = ?");
    $stmt->execute([$username]);

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $approved = $row['Approved'];

    if ($approved == 1) {
        echo "User is approved.";
    } else {
        echo "User is not approved.";
        header('Location: http://localhost/login.php');

    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $query = "SELECT Name FROM Category";
    $stmt = $pdo->prepare($query);
    $stmt->execute();

    $categories = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (!empty($categories)) {
        echo "<h2>See which book(s) belong to a certain category and reserve below</h2>";
        echo "<select id='categorySelect' onchange='loadBooks()'>";
        echo "<option value=''>-- Select Category --</option>";

        foreach ($categories as $category) {
            echo "<option value='" . $category . "'>" . $category . "</option>";
        }
        echo "</select>";

        echo "
        <script>
        function loadBooks() {
            var category = document.getElementById('categorySelect').value;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById('bookSelect').innerHTML = this.responseText;
                }
            };
            var url = 'get_books_category.php?category=' + encodeURIComponent(category);
            xhttp.open('GET', url, true);
            xhttp.send();
        }
    
    </script>
    ";


        echo "<select id='bookSelect'></select>";
        
    } else {
        echo "No categories found.";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}




try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to fetch all authors
    $query = "SELECT Author_id, CONCAT(First_Name, ' ', Last_Name) AS FullName FROM Author";
    $stmt = $pdo->prepare($query);
    $stmt->execute();

    $authors = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($authors)) {
        echo "<h2>See which book(s) belong to a certain author and reserve below</h2>";
        echo "<select id='authorSelect' onchange='loadtheBooks()'>";
        echo "<option value=''>-- Select Author --</option>";
        foreach ($authors as $author) {
            echo "<option value='" . $author['Author_id'] . "'>" . $author['FullName'] . "</option>";
        }
        echo "</select>";

        echo "
        <script>
            function loadtheBooks() {
                var author = document.getElementById('authorSelect').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById('bookSelectAuthor').innerHTML = this.responseText;
                    }
                };
                xhttp.open('GET', 'get_books_author.php?author=' + encodeURIComponent(author), true);
                xhttp.send();
            }
        </script>";

        // Placeholder for the book options
        echo "<select id='bookSelectAuthor'></select>";
        
    } else {
        echo "No authors found.";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}





        if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["submit-review"]))
                {
                    $userId = "SELECT User_id FROM User WHERE Username=:username";
                    $useridstmt = $pdo->prepare($userId);
                    $useridstmt->bindParam(":username", $username);
                    $useridstmt->execute();
                    
                    $result = $useridstmt->fetch(PDO::FETCH_ASSOC); 
                    $userId = $result['User_id']; 
                    
                    $rev = $_POST['review'];
                    $rating = $_POST['rating'];
                    $bookId = $_POST['book_id'];

                    $revquery="INSERT INTO Review(Rating,Book_id,Text,User_id,Approved) VALUES(:rating,:bookid,:text,:userid,'0')";
                    $revquerystmt=$pdo->prepare($revquery);
                    $revquerystmt->bindparam(":rating",$rating);
                    $revquerystmt->bindparam(":bookid",$bookId);
                    $revquerystmt->bindparam(":text",$rev);
                    $revquerystmt->bindparam(":userid",$userId);
                    $revquerystmt->execute();
                    header('Location: http://localhost/Book.php');

                }
        

$school_id_query = 'SELECT School_id FROM user WHERE Username = ?';

$stmt = $pdo->prepare($school_id_query);
$stmt->bindParam(1, $username, PDO::PARAM_STR);
$stmt->execute();

$row = $stmt->fetch(PDO::FETCH_ASSOC);
$id = $row['School_id'];

$sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Image, b.Thematic_Category, b.Language, b.Keywords, c.Number_of_Available_Copies
        FROM Book AS b
        INNER JOIN Copies AS c ON b.Book_id = c.Book_id
        WHERE c.School_id = ?';

$stmt = $pdo->prepare($sql);
$stmt->bindParam(1, $id, PDO::PARAM_STR);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    echo 'No books available for the given school.';
}


$stmt = null;
$pdo = null;
?>

<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <style>
        #reviews-panel {
            background-color: #f5f5f5;
            padding: 10px;
            margin-top: 20px;
        }

        #reviews-panel h2 {
            margin-top: 0;
        }

        #reviews-list {
            list-style-type: none;
            padding: 0;
        }

        #reviews-list li {
            margin-bottom: 10px;
        }

   

    </style>



<script>
        function showBookDetails() {
            var bookSelect = document.getElementById('book-select');
            var selectedBookId = bookSelect.value;
            var selectedBook = JSON.parse('<?php echo json_encode($books); ?>')[selectedBookId];

            var detailsDiv = document.getElementById('book-details');
            detailsDiv.innerHTML = '';

            var h2 = document.createElement('h2');
            h2.innerHTML = selectedBook['Title'];
            detailsDiv.appendChild(h2);

            var p1 = document.createElement('p');
            p1.innerHTML = '<strong>Author:</strong> ' + selectedBook['Author'];
            detailsDiv.appendChild(p1);

            var p2 = document.createElement('p');
            p2.innerHTML = '<strong>Publisher:</strong> ' + selectedBook['Publisher'];
            detailsDiv.appendChild(p2);

            var p3 = document.createElement('p');
            p3.innerHTML = '<strong>ISBN:</strong> ' + selectedBook['ISBN'];
            detailsDiv.appendChild(p3);

            var p4 = document.createElement('p');
            p4.innerHTML = '<strong>Number of Pages:</strong> ' + selectedBook['Number_of_Pages'];
            detailsDiv.appendChild(p4);

            var p5 = document.createElement('p');
            p5.innerHTML = '<strong>Summary:</strong> ' + selectedBook['Summary'];
            detailsDiv.appendChild(p5);

            var p6 = document.createElement('p');
            p6.innerHTML = '<strong>Thematic Category:</strong> ' + selectedBook['Thematic_Category'];
            detailsDiv.appendChild(p6);

            var p7 = document.createElement('p');
            p7.innerHTML = '<strong>Language:</strong> ' + selectedBook['Language'];
            detailsDiv.appendChild(p7);

            var p8 = document.createElement('p');
            p8.innerHTML = '<strong>Keywords:</strong> ' + selectedBook['Keywords'];
            detailsDiv.appendChild(p8);

            var p9 = document.createElement('p');
            p9.innerHTML = '<strong>Copies Available:</strong> ' + selectedBook['Number_of_Available_Copies'];
            detailsDiv.appendChild(p9);

            var img = document.createElement('img');
            img.src = 'http://localhost/Book_cover/' + selectedBook['Image'];
            img.width = '250';
            img.height = '250';
            detailsDiv.appendChild(img);
            if(selectedBook.Number_of_Available_Copies > 0)
                        {
                            var takeButton = document.createElement('button');
                            takeButton.innerHTML = 'Reserve book now!';
                            takeButton.onclick = function() {
                                //alert("hello");
                                //function takebook(selectedBookId);
                                //$sql = "UPDATE Copies SET Number_of_Available_Copies = 0 WHERE Copies_id = 1 ;"
                                //alert("Successful loan");
                                /* $username = $_SESSION['username'];

                                    }*/
                                    // Send an Ajax request to update the database
                               
                                    

                                var xmlhttp = new XMLHttpRequest();
                                xmlhttp.onreadystatechange = function() {
                                    if (this.readyState == 4 && this.status == 200) {
                                        // Handle the server response here
                                        
                                    }
                                };
                                
                                 xmlhttp.open("POST", `update_book.php?Book_id=${selectedBook.Book_id}`, true);
                                 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                
                                xmlhttp.send();
                           
                            };
                            detailsDiv.appendChild(takeButton)
                        }
                        else
                        {
                            var p10 = document.createElement('p');
                            p10.innerHTML = 'No copies available';
                            detailsDiv.appendChild(p10);
                        }
                    


            var reviewForm = document.createElement('form');
            reviewForm.method = 'post';
            reviewForm.action = 'Book.php';

            var ratingLabel = document.createElement('label');
            ratingLabel.for = 'rating';
            ratingLabel.innerHTML = 'Rating: ';

            var ratingInput = document.createElement('input');
            ratingInput.type = 'number';
            ratingInput.name = 'rating';
            ratingInput.min = '0';
            ratingInput.max = '5';
            ratingInput.required = true;

            var reviewLabel = document.createElement('label');
            reviewLabel.for = 'review';
            reviewLabel.innerHTML = 'Review: ';

            var reviewInput = document.createElement('textarea');
            reviewInput.name = 'review';
            reviewInput.required = true;

            var bookIdInput = document.createElement('input');
            bookIdInput.type = 'hidden';
            bookIdInput.name = 'book_id';
            bookIdInput.value = selectedBook['Book_id'];

            var submitButton = document.createElement('button');
            submitButton.type = 'submit';
            submitButton.name = 'submit-review';
            submitButton.innerHTML = 'Submit Review';

            reviewForm.appendChild(ratingLabel);
            reviewForm.appendChild(ratingInput);
            reviewForm.appendChild(document.createElement('br'));
            reviewForm.appendChild(reviewLabel);
            reviewForm.appendChild(reviewInput);
            reviewForm.appendChild(document.createElement('br'));
            reviewForm.appendChild(bookIdInput);
            reviewForm.appendChild(submitButton);

            detailsDiv.appendChild(reviewForm);
            fetchReviews(selectedBook['Book_id']);
        }

        





        function fetchReviews(bookId) {
  var reviewsList = document.getElementById('reviews-list');
  reviewsList.innerHTML = '';

  fetch('fetch_reviews.php?Book_id=' + bookId)
    .then(function(response) {
      return response.json();
    })
    .then(function(reviews) {
      console.log(reviews); // Check the response data in the browser console

      if (reviews.length > 0) {
        reviews.forEach(function(review) {
          var li = document.createElement('li');
          li.innerHTML = '<strong>Rating:</strong> ' + review['Rating'] + '<br>' +
            '<strong>Review:</strong> ' + review['Text'] + '<br>' +
            '<strong>User:</strong> ' + review['Username'];
          reviewsList.appendChild(li);
        });
      } else {
        var li = document.createElement('li');
        li.innerHTML = 'No reviews available for this book.';
        reviewsList.appendChild(li);
      }
    })
    .catch(function(error) {
      console.error('Error fetching reviews:', error);
    });
}


        function reserveBook(event) {
            event.preventDefault();
            var form = event.target;

            var formData = new FormData(form);
            fetch(form.action, {
                method: form.method,
                body: formData
            })
            .then(function(response) {
                // Handle the response here (e.g., show a success message)
            })
            .catch(function(error) {
                console.error('Form submission error:', error);
            });
        }

        function submitReview(event) {
            event.preventDefault();
            var form = event.target;

            var formData = new FormData(form);
            fetch(form.action, {
                method: form.method,
                body: formData
            })
            .then(function(response) {
                // Handle the response here (e.g., show a success message)
            })
            .catch(function(error) {
                console.error('Form submission error:', error);
            });
        }
    </script>
</head>
<body>
    <h1>Books</h1>
    <label for="book-select">Select a book:</label>
    <select id="book-select" onchange="showBookDetails()">
        <option value="">Select</option>
        <?php
        foreach ($books as $index => $book) {
            echo '<option value="' . $index . '">' . $book['Title'] . '</option>';
        }
        ?>
    </select>
    <div id="book-details"></div>
    <div id="reviews-panel">
        <h2>Reviews</h2>
        <ul id="reviews-list"></ul>
    </div>

    <script>
        var reserveForm = document.querySelector('#book-details form[action="update_book.php"]');
        reserveForm.addEventListener('submit', reserveBook);

        var reviewForm = document.querySelector('#book-details form[action="Book.php"]');
        reviewForm.addEventListener('submit', submitReview);
    </script>





</body>
</html>