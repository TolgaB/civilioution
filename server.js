var io = require('socket.io')(3000);
console.log("Server Running");
var questionList= [];
questionList[0] = "Host meet and greet on Thursday?";
questionList[1] = "Remove Potholes in HS";
questionList[2] = "Add More Trash Cans"
questionList[3] = "Change park opening times"
questionList[4] = "Increase length of Summer Break?"
var voteList = [];
voteList[0] = 0;
voteList[1] = 0;
voteList[2] = 0;
voteList[3] = 0;
voteList[4] = 0;
var commentList = [];
var comments1 = [];
var comments2 = [];
var comments3 = [];
var comments4 = [];
var comments5 = [];
var comments6 = [];
var comments7 = [];
var comments8 = [];

comments1[0] = "This is my random opinion";
comments2[0] = "This is my random opinion";
comments3[0] = "This is my random opinion";
comments4[0] = "This is my random opinion";
comments5[0] = "This is my random opinion";
comments6[0] = "This is my random opinion";
comments7[0] = "This is my random opinion";
comments8[0] = "This is my random opinion";
io.on('connection', function (socket) {





	io.sockets.emit('join', socket['id']);
	 console.log(socket['id'] + ' has connected!');

	io.sockets.emit('sendBeginData', questionList, voteList);

	io.sockets.emit('joinOnComment');


	socket.on('retrieveCommentData', function (question) {
	
		console.log(question);
		console.log("test6")
		for (var i = 0; i < questionList.length; i++) {
			if(questionList[i] == question) {

			if (i == 0) {		
				console.log("test7")
				var tempArray = comments1
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 1) {		
				console.log("test7")
				var tempArray = comments2
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 2) {		
				console.log("test7")
				var tempArray = comments3
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 3) {		
				console.log("test7")
				var tempArray = comments4
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 4) {		
				console.log("test7")
				var tempArray = comments5
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 5) {		
				console.log("test7")
				var tempArray = comments6
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 6) {		
				console.log("test7")
				var tempArray = comments7
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 7) {		
				console.log("test7")
				var tempArray = comments8
				io.sockets.emit('sendCommentBeginData', tempArray);
			}

			}
		}
	});	

	socket.on('upVote', function (question) {
	
		console.log(question);
		for (var i = 0; i < questionList.length; i++) {
			if (questionList[i] == question) {

				voteList[i] = voteList[i] + 1;
				io.sockets.emit('sendBeginData', questionList, voteList);
			}
		}
	});

	
	socket.on('downVote', function (question) {
	
		for (var i = 0; i < questionList.length; i++) {
			if (questionList[i] === question) {
				voteList[i] = voteList[i] - 1;
				io.sockets.emit('sendBeginData', questionList, voteList);
			}
		}

	});

	socket.on('commentUpdate', function (newCommentText, question) {
		
		console.log("test 8")
		for (var i = 0; i < questionList.length; i++) {

			if(questionList[i] == question) {
				console.log(i)
				console.log(questionList[i])

			console.log("test 9")

			if (i == 0) {		
				console.log("test 11")
				
				var total = comments1.length;
				comments1[total] = newCommentText;
				var tempArray = comments1;
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 1) {	
				console.log("test 10")	
				
				var total = comments1.length;
				comments2[total] = newCommentText;
				var tempArray = comments2
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 2) {		
				
				var total = comments1.length;
				comments3[total] = newCommentText;
				var tempArray = comments3
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 3) {		
				
				var total = comments1.length;
				comments4[total] = newCommentText;
				var tempArray = comments4
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 4) {		
			
				var total = comments1.length;
				comments5[total] = newCommentText;
				var tempArray = comments5
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 5) {		
			
				var total = comments1.length;
				comments6[total] = newCommentText;
				var tempArray = comments6
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 6) {		
			
				var total = comments1.length;
				comments7[total] = newCommentText;
				var tempArray = comments7
				io.sockets.emit('sendCommentBeginData', tempArray);
			}
			if (i == 7) {		
				console.log("test7")
				var total = comments1.length;
				comments8[total] = newCommentText;
				var tempArray = comments8
				io.sockets.emit('sendCommentBeginData', tempArray);
			}

			}
		}
	});




});
