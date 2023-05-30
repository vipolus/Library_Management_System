<?php
require_once('config.php');

session_start();

$username = $_SESSION['username'];

if ($username == NULL)
    header('Location: http://localhost/login.php');

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

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
            var selectedBook = <?= json_encode($books) ?>[selectedBookId];

            var detailsDiv = document.getElementById('book-details');
            detailsDiv.innerHTML = '';

            var h2 = document.createElement('h2');
            h2.innerHTML = selectedBook['Title'];
            detailsDiv.appendChild(h2);

            var p1 = document.createElement('p');
            p1.innerHTML = '<strong>Author:</strong> ' + selectedBook['First_Name'] + ' ' + selectedBook['Last_Name'];
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
            img.src ='http://localhost/Book_cover/' + selectedBook['Image'];
            img.width = '250';
            img.height = '250';
            detailsDiv.appendChild(img);

            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'update_book.php?Book_id=' + selectedBook['Book_id'];

            var button = document.createElement('button');
            button.type = 'submit';
            button.name = 'reserve-button';
            button.innerHTML = 'Reserve book now!';

            form.appendChild(button);
            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'approve_reviews.php';

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

            form.appendChild(ratingLabel);
            form.appendChild(ratingInput);
            form.appendChild(document.createElement('br'));
            form.appendChild(reviewLabel);
            form.appendChild(reviewInput);
            form.appendChild(document.createElement('br'));
            form.appendChild(bookIdInput);
            form.appendChild(submitButton);

            //detailsDiv.appendChild(form);
            detailsDiv.appendChild(form);

            form.addEventListener('submit', function(event) {
                event.preventDefault();

                var formData = new FormData(form);
                fetch(form.action, {
                    method: form.method,
                    body: formData
                })
                .then(function(response) {
                    window.location.href = '/Book.php';
                })
                .catch(function(error) {
                    console.error('Form submission error:', error);
                });
            });

            // Fetch reviews for the selected book
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
</body>
</html>
