import java.util.*;

class GaussianSplatterer {
  Random generator;
  float[] meanXY; 
  float[] sdXY;
  float[] meanRGB;
  float[] sdRGB;
  GaussianSplatterer(){
    generator = new Random();
    meanXY = new float[] {width/2,height/2};
    sdXY = new float[] {width/10,height/10};
    meanRGB = new float[] {100,150,175};
    sdRGB = new float[] {12,12,12};
  }
  
  void render(){
    //Find new Gaussians
    float[] nums = new float[5];    
    for (int i = 0; i < nums.length; i++) {
      nums[i] = (float) generator.nextGaussian();
    }
    
    //Find colors
    float[] rgbColors = new float[3];
    for (int j = 0; j<rgbColors.length; j++) {
      rgbColors[j] = nums[j]*sdRGB[j]+meanRGB[j];
    }
    
    float x = nums[3]*sdXY[0] + meanXY[0];
    float y = nums[4]*sdXY[1] + meanXY[1];
    
    noStroke();
    fill(rgbColors[0],rgbColors[1],rgbColors[2],50);
    ellipse(x,y,16,16);
  }
  
}
