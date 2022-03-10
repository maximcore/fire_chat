const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { firestore, auth } = require("firebase-admin");

admin.initializeApp();

exports.likePost = functions.region("europe-west3").https.onRequest(async (request, response) => {
	var body = request.body;
	var user = body["data"]["user"];
	var postId = body["data"]["postId"];
	var res;
	var likes = [];
	var snapshot = await firestore().collection("posts").get();
	snapshot.docs.map(doc => {
		var currentPost = doc.data();
		if (currentPost["postId"] == postId) {
			likes.push(...currentPost["postLikedByUsers"]);
			if (likes.includes(user)) {
				likes.splice(likes.indexOf(user), 1);
			}
			else {
				likes.push(user);
			}

			doc.ref.update({
				"postLikedByUsers": likes,
				"description": currentPost["description"],
				"imageUrl": currentPost["imageUrl"],
				"postId": currentPost["postId"],
				"user": currentPost["user"],
			}
			);
		}
	});

	response.status(200).send({
		"data": {

		}
	});

});

exports.commentPost = functions.region("europe-west3").https.onRequest(async (request, response) => {
	var body = request.body;
	var comment = body["data"]["comment"];
	var user = body["data"]["user"];
	var postId = body["data"]["postId"];

	var newComment;

	var comments = [];

	var snapshot = await firestore().collection("posts").get();
	snapshot.docs.map(doc => {
		var currentPost = doc.data();
		if (currentPost["postId"] == postId) {
			comments.push(...currentPost["comments"]);
			newComment = { "postId": postId, "user": user, "comment": comment, };
			comments.push(newComment);

			doc.ref.update({
				"comments": comments,
				"postLikedByUsers": currentPost["postLikedByUsers"],
				"description": currentPost["description"],
				"imageUrl": currentPost["imageUrl"],
				"postId": currentPost["postId"],
				"user": currentPost["user"],
			}
			);
		}
	});

	response.status(200).send({
		"data": {
			'postId': comments,
		}
	});

});

exports.fetchUserById = functions.region("europe-west3").https.onRequest(async (request, response) => {
	var body = request.body;
	var uid = body["data"]["uid"];
	var user = await admin.auth().getUser(uid);

	var followers = [];
	var following = [];

	// TODO(Maxim): edit to get current user
	var snapshot = await admin.firestore().collection("followers").get();
	snapshot.docs.map(doc => {
		var val = doc.data();
		for (var id in val) {
			if (id == uid) {
				var res;
				for (var i in val) {
					res = i;
					followers = val[i];
				}
			}
		}
	}
	);

	var snapshot2 = await admin.firestore().collection("following").get();
	snapshot2.docs.map(doc => {
		var val = doc.data();
		for (var id in val) {
			if (id == uid) {
				var res;
				for (var i in val) {
					res = i;
					following = val[i];
				}
			}
		}

	}
	);

	const defaultPictureUrl = "https://firebasestorage.googleapis.com/v0/b/fire-chat-mb.appspot.com/o/users%2Fdefault.png?alt=media&token=dd9e5977-f443-4308-81bc-cfb683903620";

	response.status(200).send({
		"data": {
			"user": {
				"email": user.email,
				"username": user.displayName ?? user.email,
				"profilePictureUrl": user.photoURL ?? defaultPictureUrl,
				"id": uid,
				"followers": followers,
				"following": following,
			}
			,
		}
	});
});

exports.followUser = functions.region("europe-west3").https.onRequest(async (request, response) => {
	var body = request.body;
	var uid = body["data"]["uid"];
	var fId = body["data"]["followingId"];
	var following = [];
	var followers = [];

	var snapshot = await admin.firestore().collection("following").get();
	snapshot.docs.map(doc => {
		var ids = doc.data();
		for (var id in ids) {
			if (id == fId) {
				following.push(...ids[id]);
				if (following.includes(uid)) {
					following.splice(following.indexOf(uid), 1);
				}
				else {
					following.push(uid);
				}
				doc.ref.update({
					[fId]: following,
				});
			}
		}

	});

	var snapshot2 = await admin.firestore().collection("followers").get();
	snapshot2.docs.map(doc => {
		var ids = doc.data();
		for (var id in ids) {
			if (id == uid) {
				followers.push(...ids[id]);
				if (followers.includes(fId)) {
					followers.splice(followers.indexOf(fId), 1);
				}
				else {
					followers.push(fId);
				}
				doc.ref.update({
					[uid]: followers,
				});
			}
		}
	});

	response.status(200).send({
		"data": {
			"followers": fId,
			"uid": uid,
		}
	});

});

exports.fetchFollowingUsersPosts = functions.region("europe-west3").https.onRequest(async (request, response) => {
	var body = request.body;
	var uid = body["data"]["uid"];
	var posts = [];
	var following = [];

	var followingSnapshot = await admin.firestore().collection("following").get();
	var postsSnapshot = await admin.firestore().collection("posts").get();

	followingSnapshot.docs.map(doc => {
		var data = doc.data();
		for (var id in data) {
			if (id == uid) {
				following.push(...data[id]);
				following.push(uid);
			}
		}
	});



	postsSnapshot.docs.map(doc => {
		var data = doc.data();
		var userId = data["user"]["id"];
		if (following.includes(userId)) {
			posts.push(data);
			// posts.push(
			// 	{
			// 	"postLikedByUsers": data["postLikedByUsers"],
			// 	"description": data["description"],
			// 	"imageUrl": data["imageUrl"],
			// 	"postId": data["postId"],
			// 	"user": data["user"],
			// 	}
			// );
		}
	});

	response.status(200).send({
		"data": {
			"following": following,
			"posts": posts,
		}
	});


});

