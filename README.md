# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.4.1

Tables

Users                     Boats                         Jobs
*Device                 *Paperclip

has_many  ->           <- has_many ->                 <-has_many
                      <-has_one

                      Attributes
*Device               Name                            description
                      #containers                     origin
                      Location                        destination
                                                      cost
                                                      #containers
                      Functions
                      CRUD                             CRUD
                      assign to job                 assign to boat
add boat

                      Validations
unique name            unique name                  unique name
                                                    Cost > 100
                                                    description >=20
