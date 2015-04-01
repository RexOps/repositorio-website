#!/usr/bin/env perl -w

use strict;
use warnings;
use utf8;

use DateTime;
use IO::All;

use Cwd qw(getcwd);
use Mojolicious::Lite;
use Mojo::UserAgent;
use Data::Dumper;
use Text::Markdown;

plugin 'RenderFile';

my $m = Text::Markdown->new( tab_width => 2, empty_element_suffix => '/>' );

sub get_news {
  my @content = eval { local (@ARGV) = ("news.txt"); <>; };
  chomp @content;

  my @ret;
  for my $line (@content) {
    my ( $date, $text ) = split /,/, $line, 2;
    push @ret, { date => $date, text => $text };
  }

  return @ret;
}

get '/' => sub {
  my ($self) = @_;
  $self->stash( "news", [get_news] );
  $self->render(
    "index",
    root => 1,
    cat  => "home",
    css  => "default_start.css"
  );
};

get '/*file' => sub {
  my ($self) = @_;

  my $template = $self->param("file");

  $self->stash( "news", [get_news] );
  $self->stash( "css", "default.css" );

  my ($cat) = split( /\//, $template );
  $cat ||= "";
  $self->stash( "cat", $cat );

  if ( -f "public/$template" ) {
    return $self->render_file( filepath => "public/$template", );
  }

  if ( -d "templates/$template" ) {
    $template .= "/index.html";
  }

  if ( -f "templates/$template.ep" ) {
    $template =~ s/\.html$//;
    $self->render($template);
  }
  elsif ( -f "templates/$template+md.ep" ) {
    $template =~ s/\.html$//;
    my $str = $self->render_to_string( $template, variant => 'md' );
    $self->render(
      $template,
      format  => 'html',
      variant => 'header',
      content => $m->markdown($str)
    );
  }
  else {
    $self->render( '404', status => 404, );
  }

};

app->start;

__DATA__

@@ 404.html.ep

% layout 'default';
% title '404 - File not found';

<h1>404 - I'm really sorry :(</h1>
<p>Hello. I'm a Webserver. And i'm there to serve files for you. But i'm really sorry :( I can't find the file you want to see.</p>

@@ layouts/default.html.ep
<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />

      <title>Repositor.io - Simple Linux Repository Management</title>

      <meta name="viewport" content="width=1024, initial-scale=0.5" />

      <link href="http://yandex.st/highlightjs/7.3/styles/magula.min.css" rel="stylesheet"/>
      <link rel="stylesheet" href="/css/<%= $css %>?3" type="text/css" media="screen" charset="utf-8" />
      <link rel="stylesheet" href="/css/base.css?3" type="text/css" media="screen" charset="utf-8" />

      <meta name="description" content="repositor.io - Manage your package repositories the easy way." />
      <meta name="keywords" content="package, repository, rpm, yum, createrepo, patch management, docker" />

      <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    </head>
    <body>
      <div id="body">
        <div id="navigation">
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/features.html">Features</a></li>
            <li><a href="/get.html">Get</a></li>
            <li><a href="/contribute.html">Contribute</a></li>
            <li><a href="/documentation.html">Docs</a></li>
            <li><a href="/about.html">About</a></li>
          </ul>
          <div class="clearfix"></div>
        </div>
      </div>
        <div id="content">
          <div class="content">
            <%= content %>
          </div>
        </div>
      <div id="footer">
        <div class="footer_content">
          <ul>
            <li>
              <h4>Google Group</h4>
              <p>Join our <a href="https://groups.google.com/forum/#!forum/rex-users">Google Group</a> to get support and talk to the community.</p>
            </li>
            <li>
              <h4>Latest News</h4>
              % for my $news_item (@{$news}) {
              <p style="padding-bottom: 10px;"><span class="highlight"><%= $news_item->{date} %></span> - <%== $news_item->{text} %></p>
              % }
            </li>
            <li>
              <h4>Follow Us</h4>
              <p><a href="https://github.com/RexOps/repositorio">Github</a></p>
              <p><a href="http://twitter.com/RexOps">Twitter</a></p>
            </li>
            <li>
              <h4>More Links</h4>
              <p><a href="http://www.rexify.org/" target="_blank">Home of (R)?ex</a></p>
              <p><a href="http://www.disclaimer.de/disclaimer.htm" target="_blank">Disclaimer</a></p>
            </li>
          </ul>
          <div class="clearfix"></div>
          <p class="logo_trademark"><i>1) All logos are registered trademarks of their respective companies and are not affiliated with and do not necessarily indicate that they either sponsor or endorse the services of repositor.io (and repositorio).</i></p>
        </div>
      </div>
      <script src="/js/main.js"></script>
    </body>
  </hmtl>

