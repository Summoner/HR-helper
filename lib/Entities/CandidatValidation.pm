package lib::Entities::CandidatValidation;
use Validation::Class;
    
    mixin easy => {
        required => 1,	
		min_length => 3,
		max_length => 10	       
    };
    
	field forename =>{
		mixin => 'easy',
		pattern => qr/^[A-Za-z]+$/,
		error => 'Please enter only letters with length from 3 to 10 for forename'
	};
	
	field surname =>{
		mixin => 'easy',
		pattern => qr/^[A-Za-z]+$/,
		error => 'Please enter only letters with length from 3 to 10 for surname'
	};
	
   1;
