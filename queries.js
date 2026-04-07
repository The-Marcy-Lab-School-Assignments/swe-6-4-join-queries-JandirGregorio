const pool = require('./db/pool');

// 1. Get all bookmarks along with the username of the person who saved them.
//    Only bookmarks with a matching user are returned.
//    Return an array of objects. Each object should have: title, url, username.
const getAllBookmarksWithUsername = async () => {
  // YOUR CODE HERE
};

// 2. Get all bookmarks saved by a specific user.
//    Return an array of objects. Each object should have: title, url, username.
const getBookmarksByUsername = async (username) => {
  // YOUR CODE HERE
};

// 3. Get all bookmarks that have at least one tag, along with the tag name.
//    A bookmark with two tags should appear twice (once per tag).
//    Return an array of objects. Each object should have: title, url, tag_name.
const getBookmarksWithAllTags = async () => {
  // YOUR CODE HERE
};

// 4. Get all users and the total number of bookmarks they have saved.
//    Users with zero bookmarks are included (showing 0, not excluded).
//    Group by users.user_id and alias the count as total_bookmarks.
//    Return an array of objects. Each object should have: username, total_bookmarks.
const getUsersWithBookmarkCount = async () => {
  // YOUR CODE HERE
};

// 5. Get all bookmarks that have no tags.
//    Return an array of objects. Each object should have: title, url, username.
const getBookmarksWithNoTags = async () => {
  // YOUR CODE HERE
};

const main = async () => {
  console.log('--- 1. All Bookmarks With Username ---');
  console.log(await getAllBookmarksWithUsername());

  console.log('\n--- 2. Bookmarks by alice_j ---');
  console.log(await getBookmarksByUsername('alice_j'));

  console.log('\n--- 3. Bookmarks With All Tags ---');
  console.log(await getBookmarksWithAllTags());

  console.log('\n--- 4. Users With Bookmark Count ---');
  console.log(await getUsersWithBookmarkCount());

  console.log('\n--- 5. Bookmarks With No Tags ---');
  console.log(await getBookmarksWithNoTags());

  await pool.end();
};

main();
