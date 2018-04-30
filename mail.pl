use strict;
use warnings;
use Mail::Sender;
use MIME::Lite;

 
my $to = 'mshanmukhareddy3@gmail.com';
my $cc = 'mshanmukhareddy3@gmail.com';
my $from = 'shanmukr.sw@gmail.com';
my $subject = 'Test Email';
my $message = 'This is test email sent by Perl Script';

my $msg = MIME::Lite->new(
                 From     => $from,
                 To       => $to,
                 Cc       => $cc,
                 Subject  => $subject,
                 Type     => 'multipart/mixed'
                 );
                 
# Add your text message.
$msg->attach(Type         => 'text',
             Data         => $message
             );
            
# Specify your file as attachement.
$msg->attach(Type         => 'image/png',
             Path         => '4223.png',
             Filename     => '4223.png',
             Disposition  => 'attachment'
            );       
$msg->send;
print "Email Sent Successfully\n";
