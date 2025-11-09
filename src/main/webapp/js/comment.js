function toggleComments() {
    const box = document.getElementById("comment-wrapper");

    if (!commentVisible) {
        box.style.display = "block";
        loadComments(<%= post.getId() %>);
        box.scrollIntoView({ behavior: "smooth" });
    } else {
        box.style.display = "none";
    }

    commentVisible = !commentVisible;
}
