import Foundation
import TelegramBotSDK

@main
public struct ProQNotificationsBot {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let token = readToken(from: "BOT_TOKEN")
        let bot = TelegramBot(token: token)

        while let update = bot.nextUpdateSync() {
            if let message = update.message, let from = message.from, let text = message.text {
                bot.sendMessageAsync(
                    chatId: .chat(from.id),
                    text: "Hi \(from.firstName)! You said: \(text).\n"
                )
            }
        }

        fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
    }
}
