package Site;

use Mojo::Base 'Pitahaya::PageType';
use version;

sub GET {}

sub page_not_found {
    my ($self) = @_;
    $self->controller->render(text => "Not found.", status => 404);
}

1;