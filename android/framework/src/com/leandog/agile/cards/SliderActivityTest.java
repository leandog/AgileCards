package com.leandog.agile.cards;

import android.content.Intent;
import android.test.ActivityUnitTestCase;


public class SliderActivityTest extends ActivityUnitTestCase<SliderActivity> {

    public SliderActivityTest() {
        super(SliderActivity.class);
    }
    
    public void test_title_gets_set_when_showing_tinking_hats() {
        Intent intent = new Intent();
        intent.putExtra(Constants.CARDS, R.id.const_thinking_hats);
        startActivity(intent, null, null);
        assertEquals(getActivity().getString(R.string.thinking_hats), getActivity().getTitle().toString());
    }

}
