Factory.define :bigup do |bigup|
  bigup.title "fp!"
  bigup.name "Billy Zilch"
  bigup.content "this is it."
  bigup.association :spool
end

Factory.define :spool do |spool|
end
