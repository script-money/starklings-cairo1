// options1.cairo
// Execute `starklings hint options1` or use the `hint` watch subcommand for a hint.

use option::OptionTrait;

// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(time_of_day: u8) -> Option<u8> {
    // We use the 24-hour system here, so 10PM is a value of 22 and 12AM is a value of 0
    // The Option output should gracefully handle cases where time_of_day > 23.
    // TODO: Complete the function body - remember to return an Option!
    // match time_of_day {
    //     0...22 => Option::Some(5_u8),
    //     _ => Option::None(()),
    // }
    if time_of_day < 22_u8 {
        Option::Some(5_u8)
    } else if time_of_day <= 24_u8 {
        Option::Some(0_u8)
    }else{
        Option::None(())
    }
}


#[test]
fn check_icecream() {
    assert(maybe_icecream(9_u8).unwrap() == 5_u8, 'err_1');
    assert(maybe_icecream(10_u8).unwrap() == 5_u8, 'err_2');
    assert(maybe_icecream(23_u8).unwrap() == 0_u8, 'err_3');
    assert(maybe_icecream(22_u8).unwrap() == 0_u8, 'err_4');
    assert(maybe_icecream(25_u8).is_none(), 'err_5');
}

#[test]
fn raw_value() {
    // TODO: Fix this test. How do you get at the value contained in the Option?
    let icecreams = maybe_icecream(12_u8);
    assert(icecreams.unwrap() == 5_u8, 'err_6');
}