// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

/**
 
 */
public class CompoundAttribute: Attribute {
    
    ///
    public internal(set) var attributes: [Attribute] = []
    
    // MARK: Public methods
    
    /**
         Sets the `priority` of the constraint
         - parameter priority: `Priority` enum specifying the
         priority of the constraint
         - returns: the `Attribute` instance
     */
    public override func with(priority: Priority) -> Self {
        super.with(priority)
        for attribute in self.attributes {
            attribute.with(priority)
        }
        return self
    }
    
    /**
         Sets the `when` closure of the `Attribute`
         - parameter closure: `Closure` to be called before
         installing a constraint
         - returns: the `Attribute` instance
     */
    public override func when(closure: Condition?) -> Self {
        super.when(closure)
        for attribute in self.attributes {
            attribute.when(closure)
        }
        return self
    }
    
    // MARK: Internal methods
    internal override func installOnView(view: UIView) {
        // Reference to the target view
        self.createView = view
        
        // Install each one of the `Attribute` objects 
        // composing the `CompoundAttribute`
        for attribute in attributes {
            attribute.installOnView(view)
        }
    }
    
}