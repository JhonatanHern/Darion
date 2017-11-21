/*
 * This file provides the functionality of the app
 * it is written entirely in vanilla js (no frameworks)
 * 
*/

//the following object stores some data about the studies

var studies = {
	"Radiología" : {
		description : "Descripción del estudio sobre Radiología"
	},
	"Tomografía" : {
		description : "Descripción del estudio sobre Tomografía"
	},
	"Mamografía" : {
		description : "Descripción del estudio sobre Mamografía"
	},
	"Intervencionismo" : {
		description : "Descripción del estudio sobre Intervencionismo"
	},
	"Gammagrafía" : {
		description : "Descripción del estudio sobre Gammagrafía"
	},
	"Rayos X" : {
		description : "Descripción del estudio sobre Rayos"
	},
	"Densitometría ósea" : {
		description : "Descripción del estudio sobre Densitometría"
	} 
}

//a shorthand for the loading animation
var spinner = {
	element : document.getElementById('loader'),
	show    : function(){this.element.style.display ='block'},
	hide    : function(){this.element.style.display ='none'}
}

//a shorthand used to set and get the title of the page
var title = {
	tag : document.getElementsByTagName('h1')[0],
	set : function(e){
		transitionHandler.titleStack.push(e)
		this.tag.textContent = e
	},
	get : function() {return this.tag.textContent}
}
//a shorthand used to set the description
var description = {
	tag : document.getElementById('study-description'),
	set : function(e){
		this.tag.textContent = studies[e].description
	}
}
/*
 *  Service Worker Registration (for PWA)
 *  more information at:
 *  https://developers.google.com/web/progressive-web-apps/
*/
if ('serviceWorker' in navigator) {
	window.addEventListener('load', function() {
		navigator.serviceWorker.register('/serviceWorker.js').then(function(registration) {
			// Registration was successful
			console.log('ServiceWorker registration successful with scope: ', registration.scope);
		}, function(err) {
			// Registration failed
			console.log('ServiceWorker registration failed: ', err)
		});
	});
}

/*
 * In order to handle the screen transitions without having
 * to worry about CSS, the following object will handle the
 * transitions and use a stack in order to maintain a history
 * */
var transitionHandler = {
	stack : ['main'], // the main is already being displayed

	titleStack : ['BIENVENIDOS'],//stack for titles

	backButton : document.getElementById('back-button'),

	newScreen : function (newId) {
		let oldId = this.stack[ this.stack.length - 1 ] // last elemant of the stack
		document.getElementById(oldId).style.display = 'none'
		document.getElementById(newId).style.display = 'block'
		this.backButton.style.display = 'block'
		this.stack.push(newId)
	},

	back : function () {
		if (this.stack.length === 1) {
			console.error('no more movements back')
			return
		}

		let currentScreenId = this.stack.pop()
		let currentScreen = document.getElementById( currentScreenId )
		currentScreen.style.display = 'none'

		if (currentScreen.getAttribute('titleChanger')) {
			this.titleStack.pop()
			title.set( this.titleStack[ this.titleStack.length - 1 ] )
		}

		let previousScreenId = this.stack[ this.stack.length - 1 ] // last elemant of the stack
		document.getElementById( previousScreenId ).style.display = 'block'

		if (this.stack.length === 1) {
			this.backButton.style.display = 'none'
			title.set('BIENVENIDOS')
		} else {
			this.backButton.style.display = 'block'
		}
	},

	start : function () {
		this.backButton.addEventListener('click',this.back.bind(this))
	}
}

transitionHandler.start()

/* The following code changes the main title when the right select
 * element's change. the Array.from function let us use the static list
 * of nodes as an array.
*/
Array.from(document.getElementsByClassName('title-changer')).forEach(function(element) {
	element.addEventListener('change',function(e) {
		title.set(this.value)
	})
})
/*
 * the following functions add event listeners in order to display
 * the correct frame with the right title whenever we have to
*/
document.getElementById( 'first-picker' ).addEventListener( 'change' , function() {
	let study = this.value
	description.set( study )
	transitionHandler.newScreen('menu2')
})

document.getElementById( 'contact-button' ).addEventListener( 'click' , function() {
	transitionHandler.newScreen('contact')
	title.set('Contacto')
})

document.getElementById( 'study-type' ).addEventListener( 'click' , function() {
	fetchWrapper( 'mods.php' , {} , function(err,res) {
		if (err) {
			console.log('error in request')
			return
		}
		let options = ''
		res.forEach(e=>options += `<option value=${e}>${e}</option>`)
		transitionHandler.newScreen('modality-picker-panel')
	})
})

/*
 * Since we will only ask for information using fetch API, get method 
 * and json for the response, this is a wrapper for the
 * request, it also shows the loading icon until the response is served.
*/
function fetchWrapper(url,params,callback){
	spinner.show()
	url = 'queries/' + url + '?study=' + encodeURIComponent( params.study )
	if (params.title) {
		url += '&title=' + encodeURIComponent( params.title )
	}
	fetch( url ).then( function( resp ) {
		if(resp.ok) {
			return resp.json()
		}
		callback( true )
	}).then(function( json ) {
		callback( false , json )
		spinner.hide()
	}).catch(function( error ) {
		console.log('There has been a problem with your fetch operation: ' + error.message)
		callback( true )
	})
}