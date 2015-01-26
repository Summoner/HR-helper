package lib::Entities::Validation;
use Validation::Class;

    mixin name_and_forename => {
        required => 1,
		min_length => 3,
		max_length => 10,
		pattern => qr/^[A-Za-z]+$/
    };
	mixin age => {
        required => 1,
		min_length => 1,
		max_length => 2,
		pattern => qr/^\d+$/
    };
	mixin email => {
        required => 1,
		pattern => qr/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}$/
    };
	mixin children_and_telephone => {
        required => 1,
		min_length => 1,
		max_length => 15,
		pattern => qr/^\d+$/
    };

	field forename =>{
		mixin => 'name_and_forename',
		error => 'Please enter only letters with length from 3 to 10 for forename'
	};

	field surname =>{
		mixin => 'name_and_forename',
		error => 'Please enter only letters with length from 3 to 10 for surname'
	};

	field citizenship =>{
		mixin => 'name_and_forename',
		error => 'Please enter only letters with length from 3 to 10 for citizenship'
	};

	field marital_status =>{
		mixin => 'name_and_forename',
		error => 'Please enter only letters with length from 3 to 10 for marital status'
	};

	field email =>{
		mixin => 'email',
		error => 'Please enter valid email address'
	};

	field age =>{
		mixin => 'age',
		error => 'Please enter only digits with length from 1 to 2 for age'
	};

	field children =>{
		mixin => 'children_and_telephone',
		error => 'Please enter only digits with length from 1 to 15 for children number'
	};

	field phone_number =>{
		mixin => 'children_and_telephone',
		error => 'Please enter only digits with length from 1 to 15 for phone number'
	};
1;
