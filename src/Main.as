package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author Keith
	 */
	public class Main extends Sprite 
	{
		
		private var baseRate:Number = 0.65;

		private var kilometerInput:TextField;
		private var pricePerLiterInput:TextField;
		
		private var carAsavings:Number = 0.1;
		private var carBsavings:Number = 0.05;
		private var carCsavings:Number = 0;
		
		private var carAOutput:TextField;
		private var carBOutput:TextField;
		private var carCOutput:TextField;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			
			// create inputs
			var kilometerLabel:TextField = new TextField();
				kilometerLabel.text = "Kilometers:";
				kilometerLabel.selectable = false;
			addChild(kilometerLabel);
			kilometerInput = new TextField();
				kilometerInput.type = TextFieldType.INPUT;
				kilometerInput.x = kilometerLabel.width;
				kilometerInput.border = true;
				kilometerInput.height = 20;
			addChild(kilometerInput);
			
			var pricePerLiterLabel:TextField = new TextField();
				pricePerLiterLabel.text = "price per Liter:";
				pricePerLiterLabel.selectable = false;
				pricePerLiterLabel.y = 20;
			addChild(pricePerLiterLabel);
			pricePerLiterInput = new TextField();
				pricePerLiterInput.type = TextFieldType.INPUT;
				pricePerLiterInput.y = pricePerLiterLabel.y;
				pricePerLiterInput.x = pricePerLiterLabel.width;
				pricePerLiterInput.border = true;
				pricePerLiterInput.height = 20;
			addChild(pricePerLiterInput);
			
			// create your car outputs
			carAOutput = createOutputArea("Car A:", 40);
			carBOutput = createOutputArea("Car B:", 60);
			carCOutput = createOutputArea("Car C:", 80);
			
			// setup listeners
			kilometerInput.addEventListener(Event.CHANGE, calculateSavings);
			pricePerLiterInput.addEventListener(Event.CHANGE, calculateSavings);
		}
		private function createOutputArea(label:String, y:Number):TextField {
			var outputLabel:TextField = new TextField();
				outputLabel.text = label;
				outputLabel.selectable = false;
				outputLabel.y = y;
			addChild(outputLabel);
			var outputTextField:TextField = new TextField();
				outputTextField.y = outputLabel.y;
				outputTextField.x = outputLabel.width;
				outputTextField.border = true;
				outputTextField.borderColor = 0xff0000;
				outputTextField.height = 20;
			addChild(outputTextField);
			return outputTextField;
		}
		private function calculateSavings(e:Event):void {
			// first check both input fields have something and are numbers:
			if (pricePerLiterInput.text.length > 0 && kilometerInput.text.length > 0 &&
				!isNaN(Number(pricePerLiterInput.text)) && !isNaN(Number(kilometerInput.text))) {
				// set our vars
				var pricePerLiter:Number = Number(pricePerLiterInput.text);
				var kilometers:Number = Number(kilometerInput.text);
				// calculate price per kilometer
				var pricePerKilometer:Number = pricePerLiter * baseRate;
				var totalPrice:Number = pricePerKilometer * kilometers;
				// now set outputs
				carCOutput.text = (totalPrice * carCsavings).toString();
				carBOutput.text = (totalPrice * carBsavings).toString();
				carAOutput.text = (totalPrice * carAsavings).toString();
			}
			
		}
		
	}
	
}