package com.leandog.agile.cards;

import android.content.Intent;
import android.test.ActivityUnitTestCase;

public class HomeActivityTest extends ActivityUnitTestCase<HomeActivity> {

    public HomeActivityTest() {
        super(HomeActivity.class);
    }

    public void test_clicking_on_t_shirt_sizing_starts_slider_activity() {
        startActivity(new Intent(), null, null);
        getActivity().findViewById(R.id.t_shirt_sizing).performClick();
        assertEquals(getStartedActivitysComponentClassName(), getSliderActivitesClassName()); 
    }

    public void test_clicking_on_t_shirt_sizing_starts_slider_activity_for_t_shirts() {
        startActivity(new Intent(), null, null);
        getActivity().findViewById(R.id.t_shirt_sizing).performClick();
        assertEquals(getStartedActivityIntent().getIntExtra(Constants.CARDS, -1), R.id.const_t_shirt_sizing); 
    }
    
    public void test_clicking_on_fist_to_five_starts_slider_activity() {
        startActivity(new Intent(), null, null);
        getActivity().findViewById(R.id.fist_to_five).performClick();
        assertEquals(getStartedActivitysComponentClassName(), getSliderActivitesClassName()); 
    }
    
    public void test_clicking_on_collaberation_8_starts_slider_activity() {
        startActivity(new Intent(), null, null);
        getActivity().findViewById(R.id.collaberation_8).performClick();
        assertEquals(getStartedActivitysComponentClassName(), getSliderActivitesClassName()); 
    }
    
    public void test_clicking_on_thinking_hats_starts_slider_activity() {
        startActivity(new Intent(), null, null);
        getActivity().findViewById(R.id.thinking_hats).performClick();
        assertEquals(getStartedActivitysComponentClassName(), getSliderActivitesClassName()); 
    }

    private String getStartedActivitysComponentClassName() {
        return getStartedActivityIntent().getComponent().getClassName();
    }

    private String getSliderActivitesClassName() {
        return SliderActivity.class.getName();
    }
}
