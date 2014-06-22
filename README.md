# OmniAuth Mendeley

This is the unofficial [OmniAuth 1.0](https://github.com/intridea/omniauth) strategy for authenticating to Mendeley via OAuth2.
To use it, you'll need to sign up at [Mendeley.com](http://mendeley.com), sign in with given credentials
at [Mendeley Developers Page](http://dev.mendeley.com/) and then create an OAuth2 app.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :mendeley, ENV['API_KEY'], ENV['API_SECRET']
end
```

## Authentication Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
       "provider" => :mendeley,
            "uid" => "asdvwsas-2382-29cc-552b-442dvd5q235ae",
           "info" => {
              "name" => "Alexander White",
        "first_name" => "Alexander",
         "last_name" => "White",
             "email" => "your_mail@gmail.com",
             "image" => "http://s3.amazonaws.com/mendeley-photos/awaiting.png",
              "urls" => {
            "mendeley" => "http://www.mendeley.com/profiles/alexander-white/"
        }
    },
    "credentials" => {
                "token" => "long_string",
        "refresh_token" => "long_string",
           "expires_at" => 1403397662,
              "expires" => true
    },
          "extra" => {
        "raw_info" => {
                         "id" => "asdvwsas-2382-29cc-552b-442dvd5q235ae",
                 "first_name" => "Alexander",
                  "last_name" => "White",
               "display_name" => "Alexander White",
                      "email" => "your_mail@gmail.com",
                       "link" => "http://www.mendeley.com/profiles/alexander-white/",
            "academic_status" => "Student (Master)",
                 "discipline" => {
                "name" => "Computer and Information Science"
            },
                      "photo" => {
                "standard" => "http://s3.amazonaws.com/mendeley-photos/awaiting.png",
                  "square" => "http://s3.amazonaws.com/mendeley-photos/awaiting_square.png"
            },
                   "verified" => true,
                  "user_type" => "normal",
                    "created" => "2014-06-21T20:46:54.000Z"
        }
    }
}
```

The precise information available may depend on the permissions which you request.


## Supported Rubies

Tested with the following Ruby versions:

- MRI 2.1.0

