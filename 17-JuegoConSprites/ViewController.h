#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController : UIViewController
@property BOOL comienzoPantalla;
@property NSTimer * miTiempo;
@property IBOutlet UIImageView * pantallaDeJuego;
@property int puntuacion;
@property IBOutlet UILabel * miPuntuacion;
@property int puntosPerdidos;
@property IBOutlet UILabel *puntuacionMaquina;
- (IBAction)starStop:(id)sender;
@end
