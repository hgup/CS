---
layout: default
title: Using Git with Sophos
parent: git
nav_order: 1
---

# Using Git with Sophos

Sophos is good (and all) but the problem with it is that it restricts applications to use their own `ssl` checks.
( I know that its a vague way of putting it but this is what I understand about it ).

So, we have to use these commands with git in order to turn off **ssl verification**. Here is how we do it.

- Navigate to a git repository
- Type in `git config http.sslVerify "false"`
- Continue to do push/pull operations.

## What if I don't have an existing repository and we want to `clone` a repo

Clone
: To copy or download and entire repository from a remote source to a local space

Let's say you want to get this repo [http://github.com/hgup/cs](http://github.com/hgup/cs) on your system.

### 1. Create a new repo
First create a new folder, name it and inside it type the command
```bash
git init
```
### 2. Turn off `ssl` verify
```bash
git config http.sslVerify "false"
```

### 3. Add the `remote` repo location
```bash
git remote add origin "http://github.com/hgup/cs"
```
This adds a variable `origin` which contains the repo url [http://github.com/hgup/cs](http://github.com/hgup/cs).

### 4. Pull to repo
```bash
git pull origin main
```

You are done!
