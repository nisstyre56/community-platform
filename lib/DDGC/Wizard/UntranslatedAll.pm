package DDGC::Wizard::UntranslatedAll;
# ABSTRACT: All untranslated tokens of the languages of a user

use Moose;
extends 'DDGC::Wizard::Base::ID';

sub next_rs {
	my ( $self, $c ) = @_;
	$c->d->rs('Token::Language')->untranslated_all(
		$c->user,
		$self->unwanted_ids,
	);
}

sub done_wizard {
	my ( $self, $c ) = @_;
	$c->res->redirect($c->chained_uri('Translate','index'));
}

1;