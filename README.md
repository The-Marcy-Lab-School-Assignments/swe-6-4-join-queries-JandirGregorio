# swe-6-4-join-queries

This assignment covers **JOIN queries** and **connecting to Postgres with `pg`**. You'll implement JavaScript functions that query a pre-built `bookmarks_db` database using JOIN queries.

- [Setup](#setup)
- [Grading (5 points)](#grading-5-points)
- [Expected Output](#expected-output)

## Setup

**1. Clone this repo and navigate into it.**

**2. Make a draft branch**

```sh
git checkout -b draft
```

**3. Install dependencies**

```sh
npm install
```

**4. Create your `.env` file**

Copy `.env.template` to a new file called `.env`:

```sh
cp .env.template .env
```

Then open `.env` and fill in your Postgres credentials. On Mac, you can usually leave `PG_USER` and `PG_PASSWORD` blank. On Windows/WSL, set them to `postgres` and your Postgres password.

**5. Create the database**

**Mac:**
```sh
createdb bookmarks_db # MacOS
sudo -u postgres createdb bookmarks_db # Windows/WSL
```

**6. Seed the database**

**Mac:**
```sh
psql -f db/seed.sql # MacOS
sudo -u postgres psql -f db/seed.sql # Windows/WSL
```

**7. Run the queries**

```sh
npm run db:start
```

You should see output for each function. At first all functions return `undefined` — that's expected until you implement them.

**8. Open `queries.js`** and implement each function. Re-run `npm run db:start` after each function to check your output against the [Expected Output](#expected-output) below.

---

## Grading (5 points)

You can earn 1 point per function that you properly implement! You need to get 4/5 to complete the assignment.

- [ ] `getAllBookmarksWithUsername`
- [ ] `getBookmarksByUsername`
- [ ] `getBookmarksWithAllTags`
- [ ] `getUsersWithBookmarkCount`
- [ ] `getBookmarksWithNoTags`

---

## Expected Output

Use these to check your work after implementing each function.

**<details><summary>1. getAllBookmarksWithUsername (8 rows)</summary>**

Note: rows may appear in a different order — that's okay.

| title           | url                              | username |
| --------------- | -------------------------------- | -------- |
| MDN Web Docs    | https://developer.mozilla.org    | alice_j  |
| PostgreSQL Docs | https://www.postgresql.org/docs/ | alice_j  |
| JavaScript.info | https://javascript.info          | alice_j  |
| CSS Tricks      | https://css-tricks.com           | bob_k    |
| DB Fiddle       | https://www.db-fiddle.com        | bob_k    |
| Figma           | https://www.figma.com            | bob_k    |
| Excalidraw      | https://excalidraw.com           | carla_m  |
| Node.js Docs    | https://nodejs.org/en/docs       | carla_m  |

</details>

**<details><summary>2. getBookmarksByUsername('alice_j') (3 rows)</summary>**

| title           | url                              | username |
| --------------- | -------------------------------- | -------- |
| MDN Web Docs    | https://developer.mozilla.org    | alice_j  |
| PostgreSQL Docs | https://www.postgresql.org/docs/ | alice_j  |
| JavaScript.info | https://javascript.info          | alice_j  |

</details>

**<details><summary>3. getBookmarksWithAllTags (8 rows)</summary>**

Note: rows may appear in a different order — that's okay. Bookmarks 6 (Figma) and 8 (Node.js Docs) have no tags so they are excluded.

| title           | url                              | tag_name   |
| --------------- | -------------------------------- | ---------- |
| MDN Web Docs    | https://developer.mozilla.org    | javascript |
| MDN Web Docs    | https://developer.mozilla.org    | css        |
| PostgreSQL Docs | https://www.postgresql.org/docs/ | databases  |
| JavaScript.info | https://javascript.info          | javascript |
| CSS Tricks      | https://css-tricks.com           | css        |
| CSS Tricks      | https://css-tricks.com           | tools      |
| DB Fiddle       | https://www.db-fiddle.com        | databases  |
| Excalidraw      | https://excalidraw.com           | tools      |

</details>

**<details><summary>4. getUsersWithBookmarkCount (5 rows)</summary>**

Note: rows may appear in a different order — that's okay. `total_bookmarks` will be a string (e.g. `'3'`) because Postgres returns `COUNT` as `bigint`, which `pg` maps to a JavaScript string.

| username | total_bookmarks |
| -------- | --------------- |
| alice_j  | 3               |
| bob_k    | 3               |
| carla_m  | 2               |
| dave_r   | 0               |
| emma_t   | 0               |

</details>

**<details><summary>5. getBookmarksWithNoTags (2 rows)</summary>**

| title        | url                        | username |
| ------------ | -------------------------- | -------- |
| Figma        | https://www.figma.com      | bob_k    |
| Node.js Docs | https://nodejs.org/en/docs | carla_m  |

</details>
