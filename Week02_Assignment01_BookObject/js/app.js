function Book(bookid, bookname, authorname) {
    this.bookid = bookid;
    this.bookname = bookname;
    this.authorname = authorname;
    this.displayBookDetails = function () {
      return this.bookid + "  " + this.bookname + "  " + this.authorname;
    };
  };
  const BookObject = new Book("B1010" , "MyBook" , "Divyashree Karangutkar");
  const result = document.getElementById("result");
  result.innerHTML = BookObject.displayBookDetails();