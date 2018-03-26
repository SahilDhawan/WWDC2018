/*:
 ## Core ML
 With Core ML, you can integrate trained machine learning models into your app.
 Core ML integrates a trained machine learning model into your app.
 
 A trained model is the result of applying a machine learning algorithm to a set of training data. The model makes predictions based on new input data. For example, a model that's been trained on a region's historical house prices may be able to predict a house's price when given the number of bedrooms and bathrooms.
 
 Core ML is the foundation for domain-specific frameworks and functionality. Core ML supports Vision for image analysis, Foundation for natural language processing (for example, the NSLinguisticTagger class), and GameplayKit for evaluating learned decision trees. Core ML itself builds on top of low-level primitives like Accelerate and BNNS, as well as Metal Performance Shaders.
 
 Core ML is optimized for on-device performance, which minimizes memory footprint and power consumption. Running strictly on the device ensures the privacy of user data and guarantees that your app remains functional and responsive when a network connection is unavailable.
 */

//#-hidden-code
CoreML().showProcess()
