unit module utils;

sub prompt_default is export {
  return prompt_message "Enter some text: ";
}

sub prompt_message(Str $message) is export {
  return prompt $message;
}