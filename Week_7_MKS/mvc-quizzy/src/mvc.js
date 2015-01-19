// in progress

(function () {

// model

	window.Quiz = {}

	// Quiz.vm {
	// 	quizzes: m.prop([])
	// }

	var vm = {
		users: m.prop([]),
		selectedUser: m.prop(null),
		quizOptions: m.prop(null)
	}


	Quiz.findQuestion = function(id) {
		for (var i = 0; i < Quiz.questions.length; i++) {
			if (Quiz.questions[i].id === id) return Quiz.questions[i]
		}
	}

// controller 

	Quiz.controller = function () {
		var ctrl = {}
		var vm = Quiz.vm

		ctrl.selectUser = function (userId) {
			var user = User.find(userId)
			vm.selectedUser(user)

			var quizzes = Quiz.allByUserId(userId)
			vm.quizOptions(quizzes)
		}

		ctrl.selectQuiz = function () {

		}
		return ctrl
	}




// view

	Quiz.view = function (ctrl) {
		var vm = Quiz.vm

		return m('quizzy', [
			m('h3', 'Quizzy'), [
				m("h6", 'Take the quiz below ... '),
			
			]

		])
		// return m('.quizform', [
		// 	vm.quizform
		// 	])
	}





 
// Contacts.view = function (ctrl) {  
//   var vm = Contacts.vm
//   return m('.contacts', [
//     m('h3', 'Please enter your contact information:'),
//     vm.contacts().map(function (contact, idx) {
//       return m('fieldset', [
//         m('legend', "Attendee #" + (idx+1)),
//         m('label', "Name:"),
//         m('input[type=text]', { value: contact.name() }),
//         m('br'),
//         m('label', "Email:"),
//         m('input[type=text]', { value: contact.email() })
//       ])
//     })
//   ])
// }





















})()