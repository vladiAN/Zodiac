//
//  CompatibilityListView.swift
//  Zodiac
//
//  Created by Алина Андрушок on 05.06.2023.
//

import SwiftUI

struct CompatibilityListView: View {
    @State var content: [Compatibility]
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Sign1")
                
                
                Text("Sign2")
                
            }
            
            ScrollView {
                ForEach(content, id: \.header) { compatibility in
                    VStack(alignment: .leading) {
                        Text(compatibility.header)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .padding(.vertical, 2)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(compatibility.text)
                            .foregroundColor(Color.black)
                            .padding(.bottom, 4)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CompatibilityListView_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityListView(content: [Zodiac.Compatibility(header: "Gemini and Cancer in Love and Sex", text: "When Gemini and Cancer come together in a love affair, it may be a rather curious relationship. Sensitive, emotional Cancer has trouble communicating clearly, but clear communication is what defines Gemini. Gemini’s chivalrous nature and silver tongue may encourage the Crab to come out of its shell more quickly than usual; Cancer, in turn, can teach Gemini to slow down and appreciate the world, which the frenetic Twins hardly ever take time to do. If Gemini seems to ignore Cancer or doesn’t provide them with as much reassurance and intimacy as Cancer needs, trouble may ensue. These two signs approach the world in such different manners that they must be able to understand and accept one another’s differences.\n\nCancer is the sign of home and hearth, while Gemini is the thinker. Gemini can easily slip into the role of Cancer’s knight in shining armor; Cancer returns that favor with their characteristic urge to protect the ones they love. Quality of home life is important to Cancer, and Gemini will be spoiled by their Cancer lover’s hearty home cooking, soft bed and other creature comforts. Cancer is strongly intuitive and maintains an almost psychic connection with their loved ones but can tend toward possessiveness and idealization of their Gemini partner. If Gemini just reassures Cancer that they’re loved and cherished, all will go smoothly.\n\nGemini may tend to crave wild and unusual sexual experiences, while Cancer favors a tender embrace from their partner. Their sex life may involve a lot of communication from Gemini to reassure Cancer and build intimacy over time. Cancer may be reluctant at first, but if Gemini is willing to put in the work to make their Cancer feel safe, the two will develop a strong, unbreakable bond. \n\n"), Zodiac.Compatibility(header: "Gemini and Cancer in Emotions and Intellect", text: "Gemini is an Air sign and Cancer is a Water sign. If these two signs can work together they can be a great team; after all, the best decisions are made by incorporating the emotions and the intellect. The trouble for these two lies in learning to cooperate. They come from such opposite points of view that at times it can seem as if they simply have nothing in common. Deep, emotional Cancer can also sometimes dampen Gemini’s airy enthusiasm, and light, fast-paced Gemini can leave Cancer feeling ruffled, even tattered. Balance can be achieved if they learn to talk openly with one another. Geminis also can have a hard time listening, which could infuriate Cancer’s need to be understood. Gemini may stray away from difficult conversations due to their desire to move forward and Cancer can tend to overshare their emotions, testing Gemini’s patience.\n\n"), Zodiac.Compatibility(header: "Gemini and Cancer in Trust", text: "It is important for Gemini to feel free and Cancer may struggle with giving this to them. Geminis typically don’t lie and cheat but may feel threatened by intimacy if they are not ready for it. In a living situation, Gemini wants to feel free to do their own thing and Cancer may prefer to stay home. The most difficult task for Cancer is to give this freedom to Gemini with absolute trust.\n\n"), Zodiac.Compatibility(header: "Gemini and Cancer in Friendship", text: "Gemini is a Mutable sign and Cancer is a Cardinal signs. Gemini is flexible, willing to go with the flow and follow another’s lead; Cancer is an initiator and likes to provide that lead. Gemini may try to lead by being brave, even confrontational; for it to run smoothly between these two, they both need to learn when to back down and let the other lead the way.\n\nSince Gemini is ruled by the Planet Mercury (Communication) and Cancer is ruled by the Moon (Emotions). Cancer tends to keep their emotions bottled up inside as they have trouble expressing themselves. They envy Gemini’s gift of open, clear communication afforded by the influence of Mercury. Gemini, in turn, can benefit from Cancer’s intuitive approach, so different from Gemini’s bubbly, surface nature; Cancer can teach Gemini to slow down and appreciate life instead of passing by the good things in their rush to get to the next new thing. Overall, the two can develop a strong friendship as Gemini loves a childlike partner and Cancer is intuitive enough to understand this. Their communication is quite strong and blends Gemini’s rational thinking with Cancer’s gentle approach.\n\n"), Zodiac.Compatibility(header: "Gemini and Cancer Summary", text: "What’s the best aspect of the Gemini-Cancer relationship? Once they realize they’re allies, they can soar to great heights together. Gemini is always thinking ahead, and Cancer is quietly supporting these ideas behind the scenes. Each partner’s ability to provide what the other is lacking makes theirs a fulfilling relationship.\n\n"), Zodiac.Compatibility(header: "Venus in Gemini and Venus in Cancer Compatibility", text: "Venus is the planet of love and romance. It represents how you love and what you value. Although your Sun or Moon sign may be in different aspects on your chart, consider your relationship with Venus in Gemini and Venus in Cancer.\n\nThe nurturing Venus in Cancer meets the intellectual Venus in Gemini. Venus in Gemini seeks exciting relationships with lots of activity. Regardless of other signs, Venus in Gemini will approach love in a light and witty manner. Venus in Cancer is the opposite, preferring secure and serious commitments. Both mirror qualities the other lacks. Thus, sparks can fly as Venus in Cancer nurtures and Venus in Gemini wins them over with intellect and charm.\n\nVenus in Gemini will seek to solve problems through communication and while Venus in Cancer may desire the same, they tend to favor discussing their emotions rather than the issue from a rational standpoint. If Venus in Gemini can soften their approach to be more tender and caring, and Venus in Cancer can learn to be more flexible, the two can develop a strong, unbreakable bond.\n\n"), Zodiac.Compatibility(header: "Venus in Cancer Male", text: "The Venus in Cancer male is extremely nurturing toward their loved one and they won’t be afraid to show their emotions from the beginning. They tend to seek a partner who is affectionate, tender, and attentive. The Venus in Cancer male favors a partner who is emotional and family-oriented who can make them feel secure and cherished. Venus in Cancer males have unwavering loyalty and can tend toward being jealous and possessive at times. Thus, constant reassurance and appreciation for what they do is needed to make them feel secure in a relationship.\n\n"), Zodiac.Compatibility(header: "Venus in Cancer Female", text: "The Venus in Cancer female is a natural nurturer and gravitates toward lovers who make them feel safe. They are sentimental and excellent listeners, favoring partnerships where they can pour out their love deeply. Venus in Cancer females tend not to like being approached directly as they are cautious in love since they feel things so intensely. They may have a habit of holding onto lost loves longer than they should and struggle with setting healthy boundaries.\n\n"), Zodiac.Compatibility(header: "Venus in Gemini Male", text: "The Venus in Gemini male is attracted to intellect and wit. They tend to favor intellect over physical appearance, love flirting, and the mind games that accompany the beginning of a relationship. Communication is so important to them as they fear boredom, so they tend to fall for those who provide interesting conversation. The Venus in Gemini male may express their love through love notes, poems, and letters.\n\n"), Zodiac.Compatibility(header: "Venus in Gemini Female", text: "Essential to the Venus in Gemini is a partner who can hold a real conversation. When they are in love, they will flirt, joke, and approach their partner in a light and witty manner. Venus in Gemini females can be evasive when cornered, and they are not always in touch with their feelings to express themselves clearly. Exchanging and sharing ideas in a partnership is a major turn-on for a Venus in Gemini female.\n\n")])
    }
}
